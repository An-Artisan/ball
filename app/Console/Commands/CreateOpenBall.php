<?php

namespace App\Console\Commands;

use App\Models\OpenBall;
use App\Models\UserBet;
use App\Models\UserBetOdds;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class CreateOpenBall extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'ball:start';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'open ball start';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        while (true) {
            $this->doRun();
        }

    }

    private function doRun()
    {

        try {
            /**
             * 首次运行创建
             */
            if (OpenBall::query()->where("status", "!=", OpenBall::STATUS_ENDED)->count() == 0) {
                $lastBet = OpenBall::query()->orderBy("id", "desc")->get()->first();
                $data = ["play_type" => "new1", "first_ball" => 0, "second_ball" => 0, "third_ball" => 0, "fourth_ball" => 0, "fifth_ball" => 0,
                    "open_method" => 0, "current_open_ball_time" => 300, "next_open_ball_time" => 300, "current_sealing_time" => 120, "next_sealing_time" => 120,
                    "status" => 0, "start_time" => time(), "current_phase" => 1, "win_or_lose" => 0.00];
                /**
                 * 数据库没有数据
                 */
                if (!$lastBet) {
                    $data['phase_number'] = "10000000";

                } else {
                    $data['phase_number'] = (int)$lastBet->phase_number + 1;
                }
                $result = OpenBall::query()->insert($data);
                if (!$result) {
                    throw new \Exception("首期任务创建失败");
                }
            }
            $currentBet = OpenBall::query()->where("play_type", "new1")->where("status", "!=", OpenBall::STATUS_ENDED)->get()->first();

            /**
             * 封盘
             */
            if (($currentBet->start_time + $currentBet->current_sealing_time) <= time()) {
                $currentBet->status = OpenBall::STATUS_SEALING;
                $currentBet->save();
                $currentBet->refresh();
            }


            /**
             * 开奖
             */
            if ((($currentBet->start_time) + $currentBet->current_open_ball_time) <= time()) {
                $currentBet->status = OpenBall::STATUS_ENDED;
                $currentBet->save();
                $currentBet->refresh();

                $userBetAll = UserBet::query()->where("play_type", "new1")->where("phase_number", $currentBet->phase_number)
                    ->where("is_open_lottery", UserBet::NOT_OPEN)->get();
                $userBetOdds = UserBetOdds::query()->where("play_type", "new1")->first();
                /**
                 * 寻找最优球
                 */
                $ball = $this->open($currentBet, $userBetAll->toArray(), $userBetOdds->toArray());
                $currentBet->first_ball = $ball[0];
                $currentBet->second_ball = $ball[1];
                $currentBet->third_ball = $ball[2];
                $currentBet->fourth_ball = $ball[3];
                $currentBet->fifth_ball = $ball[4];
                $currentBet->win_or_lose = $ball['money'];
                $currentBet->save();
                $this->createNextBall($currentBet);
                $this->userBetSettle($ball, $userBetAll, $userBetOdds, $currentBet);
            }
        } catch (\Exception $exception) {
            Log::debug("任务运行失败", ["fail msg" => $exception->getMessage()]);
        }
        sleep(1);
    }

    private function userBetSettle($ball, $userBetAllObject, $userBetOddsObject, $currentBet)
    {

        $userBetOdds = $userBetOddsObject->toArray();
        unset($userBetOdds['id'], $userBetOdds['play_type'], $userBetOdds['created_at'], $userBetOdds['updated_at']);
        $rules = [];
        $allWinOrLosePrice = '0.00';
        foreach ($userBetOdds as $key => $value) {
            $rules[$key] = ["bet_price" => 0, "bet_odds_price" => 0];
        }
        foreach ($userBetAllObject as $item) {
            $itemArray = $item->toArray();
            foreach ($itemArray as $key => $value) {
                if (array_key_exists($key, $userBetOdds)) {
                    $rules[$key]["bet_price"] = $value;
                    $rules[$key]["bet_odds_price"] = bcmul((string) $value, (string) $userBetOdds[$key], 2);
                }
            }
            // 当前盈亏
            $currentWinLosePrice = money($ball, $rules);
            $allWinOrLosePrice = bcadd((string)$allWinOrLosePrice, (string)$currentWinLosePrice, 2);
            $result = -$currentWinLosePrice;
            $item->win_or_lose = $result;
            $item->is_open_lottery = UserBet::ALREADY_OPEN;
            $item->save();
        }
        $currentBet->win_or_lose = $allWinOrLosePrice;
        $currentBet->save();

    }

    private function createNextBall($currentBet)
    {
        $current_phase = $currentBet->current_phase + 1;
        if ($current_phase > OpenBall::SUM_PHASE) {
            $current_phase = 1;
        }
        $data = ["play_type" => "new1", "phase_number" => $currentBet->phase_number + 1, "first_ball" => 0, "second_ball" => 0, "third_ball" => 0,
            "fourth_ball" => 0, "fifth_ball" => 0, "open_method" => 0, "current_open_ball_time" => $currentBet->next_open_ball_time,
            "next_open_ball_time" => 300, "current_sealing_time" => $currentBet->next_sealing_time, "next_sealing_time" => 120,
            "status" => 0, "start_time" => time(), "current_phase" => $current_phase, "win_or_lose" => 0.00];
        $result = OpenBall::query()->insert($data);
        if (!$result) {
            throw new \Exception("下期期任务创建失败");
        }
        return false;
    }

    private function open(OpenBall $currentBet, $userBetAll, $userBetOdds)
    {

        switch ($currentBet->open_method) {
            // 算法开奖
            case OpenBall::ALGORITHM_OPEN:
                $ball = self::algorithm($userBetAll, $userBetOdds);
                break;
            // 随机开奖
            case OpenBall::RANDOM_OPEN:
                $ball[0] = random_int(0, 9);
                $ball[1] = random_int(0, 9);
                $ball[2] = random_int(0, 9);
                $ball[3] = random_int(0, 9);
                $ball[4] = random_int(0, 9);
                break;
            // 人工开奖
            case OpenBall::ADMIN_OPEN:
                $ball[0] = $currentBet->first_ball;
                $ball[1] = $currentBet->second_ball;
                $ball[2] = $currentBet->third_ball;
                $ball[3] = $currentBet->fourth_ball;
                $ball[4] = $currentBet->fifth_ball;
                break;
            default:
                $ball = self::algorithm($userBetAll, $userBetOdds);

        }
        return $ball;
    }

    /**
     *
     * 算法开奖
     * @param $userBetAll
     * @param $userBetOdds
     * @return mixed
     * @author artisan
     * @email  g1090035743@gmail.com
     * @since  2021年01月27日11:39
     */
    private function algorithm($userBetAll, $userBetOdds)
    {
        unset($userBetOdds['id'], $userBetOdds['play_type'], $userBetOdds['created_at'], $userBetOdds['updated_at']);
        $rules = [];
        foreach ($userBetOdds as $key => $value) {
            $rules[$key] = ["bet_price" => 0, "bet_odds_price" => 0];
        }
        $test = 0.0;
        foreach ($userBetAll as $item) {
            foreach ($item as $key => $value) {
                if (array_key_exists($key, $userBetOdds)) {
                    $test = bcadd($test, $value, 2);
                    $rules[$key]["bet_price"] = bcadd((string) $rules[$key]["bet_price"], (string) $value, 2);
                    $rules[$key]["bet_odds_price"] = bcadd((string) $rules[$key]["bet_odds_price"], (string) bcmul((string) $value, (string) $userBetOdds[$key], 2), 2);
                }
            }
        }
        $firsts = range(0, 9);
        shuffle($firsts);
        $seconds = range(0, 9);
        shuffle($seconds);
        $thirds = range(0, 9);
        shuffle($thirds);
        $fourths = range(0, 9);
        shuffle($fourths);
        $fifths = range(0, 9);
        shuffle($fifths);
        $i = 0;
        foreach ($firsts as $first) {
            foreach ($seconds as $second) {
                foreach ($thirds as $third) {
                    foreach ($fourths as $fourth) {
                        foreach ($fifths as $fifth) {
                            $data[$i]["id"] = rand(1000, 999999);
                            $data[$i]['ball'] = [$first, $second, $third, $fourth, $fifth];
                            $data[$i]["money"] = money($data[$i]['ball'], $rules);
                            $i++;
                        }
                    }
                }
            }
        }

        $last_ages = array_column($data, 'money');
        array_multisort($last_ages, SORT_DESC, $data, SORT_FLAG_CASE);
        return $data[0]['ball'];
    }
}

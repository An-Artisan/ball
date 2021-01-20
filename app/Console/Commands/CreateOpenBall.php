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
                $data = ["play_type" => "new1","first_ball" => 0, "second_ball" => 0, "third_ball" => 0, "fourth_ball" => 0, "fifth_ball" => 0,
                    "open_method" => 0, "current_open_ball_time" => 300, "next_open_ball_time" => 300, "current_sealing_time" => 120, "next_sealing_time" => 120,
                    "status" => 0, "start_time" => time(), "current_phase" => 1];
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
            $currentBet = OpenBall::query()->where("play_type","new1")->where("status", "!=", OpenBall::STATUS_ENDED)->get()->first();
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
            if ((strtotime($currentBet->start_time) + $currentBet->current_open_ball_time) <= time()) {
                $currentBet->status = OpenBall::STATUS_ENDED;
                $currentBet->save();
                $currentBet->refresh();
                $this->open($currentBet);

            }
//            Log::info("this is test data");
//            $this->info('Display this on the screen');
            sleep(1);
        } catch (\Exception $exception) {
            dd($exception->getMessage());exit;
//            发送邮件
            Log::debug("创建下期任务失败", ["fail msg" => $exception->getMessage()]);
        }

    }

    private function open (OpenBall  $currentBet) {
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
        $userBetAll = UserBet::query()->where("play_type","new1")->where("phase_number",$currentBet->phase_number)
            ->where("is_open_lottery",UserBet::NOT_OPEN)->get();
        $userBetOdds = UserBetOdds::query()->where("play_type","new1")->first();
        dd($userBetOdds);exit;
        dd($userBetAll,$userBetOdds);exit;


        $rules = [
// 总和大，总和小，总和奇，总和偶，龙，虎，和，
            "sum_max" => 1, "sum_min" => 2, "sum_odd" => 3, "sum_even" => 4, "dragon" => 5, "tiger" => 6, "draw" => 7,
// 第一球大，第一球小，第一球奇，第一球偶，第一球为1，第一球为2，第一球为3，第一球为4，第一球为5，第一球为6，第一球为7，第一球为8，第一球为9，
            "first_max" => 8, "first_min" => 9, "first_odd" => 10, "first_even" => 11, "first_0" => 12, "first_2" => 13, "first_3" => 14, "first_4" => 15, "first_5" => 16, "first_6" => 17, "first_7" => 18, "first_8" => 19, "first_9" => 20,
// 第二球大，第二球小，第二球奇，第二球偶，第二球为1，第二球为2，第二球为3，第二球为4，第二球为5，第二球为6，第二球为7，第二球为8，第二球为9，
            "second_max" => 21, "second_min" => 22, "second_odd" => 23, "second_even" => 24, "second_0" => 25, "second_2" => 26, "second_3" => 27, "second_4" => 28, "second_5" => 29, "second_6" => 30, "second_7" => 31, "second_8" => 32, "second_9" => 33,
// 第三球大，第三球小，第三球奇，第三球偶，第三球为1，第三球为2，第三球为3，第三球为4，第三球为5，第三球为6，第三球为7，第三球为8，第三球为9，
            "third_max" => 34, "third_min" => 35, "third_odd" => 36, "third_even" => 37, "third_0" => 38, "third_2" => 39, "third_3" => 40, "third_4" => 41, "third_5" => 42, "third_6" => 43, "third_7" => 44, "third_8" => 45, "third_9" => 46,
// 第四球大，第四球小，第四球奇，第四球偶，第四球为1，第四球为2，第四球为3，第四球为4，第四球为5，第四球为6，第四球为7，第四球为8，第四球为9，
            "fourth_max" => 47, "fourth_min" => 48, "fourth_odd" => 49, "fourth_even" => 50, "fourth_0" => 51, "fourth_2" => 52, "fourth_3" => 53, "fourth_4" => 54, "fourth_5" => 55, "fourth_6" => 56, "fourth_7" => 57, "fourth_8" => 58, "fourth_9" => 59,
// 第五球大，第五球小，第五球奇，第五球偶，第五球为1，第五球为2，第五球为3，第五球为4，第五球为5，第五球为6，第五球为7，第五球为8，第五球为9，
            "fifth_max" => 60, "fifth_min" => 61, "fifth_odd" => 62, "fifth_even" => 63, "fifth_0" => 64, "fifth_2" => 65, "fifth_3" => 66, "fifth_4" => 67, "fifth_5" => 68, "fifth_6" => 69, "fifth_7" => 70, "fifth_8" => 71, "fifth_9" => 72,
// 前三豹子，前三顺子，前三对子，前三半顺，前三杂六
            "before_three_leopard" => 73, "before_three_straight" => 74, "before_three_two_pairs" => 75, "before_three_half_straight" => 76, "before_three_discrete" => 77,
// 中三豹子，中三顺子，中三对子，中三半顺，中三杂六
            "middle_three_leopard" => 78, "middle_three_straight" => 79, "middle_three_two_pairs" => 80, "middle_three_half_straight" => 81, "middle_three_discrete" => 82,
// 后三豹子，后三顺子，后三对子，后三半顺，后三杂六
            "after_three_leopard" => 83, "after_three_straight" => 84, "after_three_two_pairs" => 85, "after_three_half_straight" => 86, "after_three_discrete" => 87,
        ];

        foreach ($firsts as $first) {
            foreach ($seconds as $second) {
                foreach ($thirds as $third) {
                    foreach ($fourths as $fourth) {
                        foreach ($fifths as $fifth) {
                            $data[$i]['ball'] = [$first, $second, $third, $fourth, $fifth];
                            $data[$i]["money"] = rules($data[$i]['ball']);
                            $i++;
                        }
                    }
                }
            }
        }

    }
}

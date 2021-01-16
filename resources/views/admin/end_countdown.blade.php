<p id="end_time_{{$model->id}}">

    <?php
    /**
     * 本期结束时间倒计时
     */
    $end_countdown = $model->start_time + $model->current_open_ball_time - time();
    if ($model->status == 2 || $end_countdown <= 0 ) {
        $end_countdown = "已结束";
    }
    ?>
    {{ $end_countdown }}

</p>

@if($model->status != 2)
<script>
    function endStartCount(){
        end_time = document.getElementById('end_time_{{$model->id}}').innerHTML;
        if (end_time > 0) {
            document.getElementById('end_time_{{$model->id}}').innerHTML = end_time - 1;
        } else {
            document.getElementById('end_time_{{$model->id}}').innerHTML = "已结束";
        }
        setTimeout(endStartCount,1000);    //setTimeout是超时调用，使用递归模拟间歇调用
    }
    setTimeout(endStartCount,1000);

</script>
@endif

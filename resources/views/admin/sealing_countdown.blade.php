<p id="sealing_time_{{$model->id}}">

    <?php
    /**
     * 本期封盘时间倒计时
     */
    $end_countdown = $model->start_time + $model->current_sealing_time - time();
    if ($model->status == 2 || $end_countdown <= 0) {
        $end_countdown = "已封盘";
    }
    ?>
    {{ $end_countdown }}

</p>

@if($model->status != 2)
<script>
    function sealingStartCount(){
        sealing_time = document.getElementById('sealing_time_{{$model->id}}').innerHTML;
        if (sealing_time > 0) {
            document.getElementById('sealing_time_{{$model->id}}').innerHTML = sealing_time - 1;
        } else {
            document.getElementById('sealing_time_{{$model->id}}').innerHTML = "已封盘";
        }
        setTimeout(sealingStartCount,1000);    //setTimeout是超时调用，使用递归模拟间歇调用
    }
    setTimeout(sealingStartCount,1000);

</script>
@endif

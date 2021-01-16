
<div style="text-align: center">
    @if($id >= 0)
        结束倒计时：<span><b id="bet_end_time">{{$id}}</b> <span>秒</span></span>
    @else
        结束倒计时：<span><b id="bet_end_time">已结束</b></span>
    @endif
</div>
<hr>
<script>
    function startCount() {
        time = document.getElementById('bet_end_time').innerHTML;
        if (time > 0) {
            document.getElementById('bet_end_time').innerHTML = time - 1;
        } else {
            document.getElementById('bet_end_time').innerHTML = "已结束"
        }

        setTimeout(startCount, 1000);    //setTimeout是超时调用，使用递归模拟间歇调用
    }

    sealing = setTimeout(startCount, 1000);


</script>

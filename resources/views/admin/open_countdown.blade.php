<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">

    结束时间：<p id="end_time">{{$id}}</p>

</div>
<script>
    function startCount(){
        time = document.getElementById('end_time').innerHTML;
        document.getElementById('end_time').innerHTML =  time - 1;
        console.log(time);
        setTimeout(startCount,1000);    //setTimeout是超时调用，使用递归模拟间歇调用
    }
    setTimeout(startCount,1000);

</script>

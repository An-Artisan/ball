<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">

    结束时间：<p id="end_time">{{$id}}</p>

<script>

    setInterval(function () {
        time = document.getElementById('end_time').innerHTML;
        document.getElementById('end_time').innerHTML =  time - 1;
        console.log(time);
    },1000);

</script>

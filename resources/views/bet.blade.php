<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>打印页面</title>
</head>
<body>
<p>本期单号：{{$phaseNumber}}</p>
<p>本次单号：{{$orderNumber}}</p>
<p>下注总额：{{$sumPrice}}</p>
 @foreach ($data as $item)
     <p>已选：{{$item['name']}} 金额： {{ $item['bet_price'] }} 赔率：{{$item['bet_odds']}}</p>
 @endforeach
</body>
</html>

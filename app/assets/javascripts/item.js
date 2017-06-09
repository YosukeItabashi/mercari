// 入力された価格に応じて販売手数料と販売利益の計算
$(function() {
  $(".input-price-area").on("keyup", function() {
    var input = ($(".input-price-area").val());
    var commission = input * 0.1;
    var profits = input - commission;

    $(".commision").children('.l-right').text("￥" + commission);
    $(".profits").children('.l-right').text("￥" + profits);
  });
});

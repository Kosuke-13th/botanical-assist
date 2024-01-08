document.addEventListener("DOMContentLoaded", function() {
  var wateringIdSelect = document.getElementById("watering-day"); // IDが"item-prefecture"のセレクトボックスを取得
  var wateringDayInput = document.getElementById("start-watering-day"); // IDが"start-watering-day"の日付入力を取得

  wateringIdSelect.addEventListener("change", function() {
    if (wateringIdSelect.value == 2) { // もし選択された値が1なら
      // :watering_dayを3日増やす処理
      var currentDate = new Date(wateringDayInput.value);
      currentDate.setDate(currentDate.getDate() + 3);

      // 増やした日付をフォーマットしてセット
      wateringDayInput.value = currentDate.toISOString().slice(0, 10);
    }
  });
});

window.addEventListener("turbo:load", day);
window.addEventListener("turbo:render", day);

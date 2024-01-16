document.addEventListener("DOMContentLoaded", function() {
  let checkbox = document.getElementById("work_check");

  checkbox.addEventListener("change", function() {
    if (this.checked) {
      // チェックが入った場合の処理
      console.log('水やりが完了しました。');
    } else {
      // チェックが外れた場合の処理
    }
  });

  function updateWateringDay() {
    Rails.ajax({
      type: 'PUT',
      url: '/update_watering_day', // このパスは実際のルーティングに合わせて変更してください
      data: 'authenticity_token=' + encodeURIComponent('<%= form_authenticity_token %>'),
      success: function(data) {
        console.log('水やりが完了しました。');
      },
      error: function() {
        console.error('エラーが発生しました。');
      }
    });
  }
});

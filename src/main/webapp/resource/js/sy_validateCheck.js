/**
 * 
 */
window.addEventListener('load', function() {
	console.log('validateCheck is included')
	document.querySelector('form').addEventListener('submit',function(){
	var invals = document.querySelectorAll(':invalid')
	invals.forEach(function(){
		console.log(this)
	})
		return false;
	})
})

document.addEventListener('keydown', function(event) {
  if (event.keyCode == 13) {
    event.preventDefault();
  };
}, true);

//폼아이디랑 폼 action 바꿀거 전체, 제출할때 필요한 숨겨진 real-submit-btn있어야함
function multipathSubmit(formId, realpath) {
	let formm = document.querySelector("#" + formId)
	formm.action = realpath;
	document.querySelector('#real-submit-btn').click();
}

//invalid-feedback 클래스 바꾸는거
function invalidClass(inputid,feedbackid) {
	$(feedbackid).removeClass('valid-feedback');
	$(feedbackid).addClass('invalid-feedback');
	$(inputid).addClass('is-invalid');
}
function validClass(inputid,feedbackid) {
	$(inputid).addClass('valid-feedback');
	$(inputid).removeClass('invalid-feedback');
	$(feedbackid).removeClass('is-invalid');
}
/**
 * 
 */
console.log('sy_fetchs included')

/*var accountList=[];
var accountListfalse=[];
var accountListBoth=[];

function fetchAccountList(queryString){
	let url="/ferp/selectAccountJson.do"+queryString;
	 fetch(url).then(function(response){return response.json() }).then(function(json){
	 	accountList=json.accountList;
	 	accountListfalse=json.accountListfalse;
	 	accountListBoth=[...accountList,...accountListfalse]
	 	console.log('어카운트리스트'+accountList)
	 }).catch(function(err){console.log(err)})
}
*/
function fetchActiveList(){
	let url ="/ferp/selectActiveDatalist.do"
	fetch(url).then(function(response){return response.json() }).then(function(json){
	makeOptions(json.storeList,'frRegiNum','frName','#storeList')
	makeOptions(json.empList,'empnum','ename','#empList')
	makeOptions(json.productList,'productNum','productName','#productList')
	}).catch(function(err){console.log(err)})
}

	
var fetchUpdatePromise =function(formid, pathurl) {
	  return new Promise((resolve, reject) => {
	    let url = pathurl + $(formid).serialize();
	    fetch(url).then(response => response.text())
	      .then(text => {
			resolve(text+'건 성공');
	      })
	      .catch(error => {
	        reject(error);
	      });
	  });
	}
	
var fetchSelectPromise = function(formid,pathurl){
	return new Promise(function(resolve,reject){
		 let url = pathurl + $(formid).serialize();
		 console.log(url)
		 fetch(url).then(response=>response.json()).then(json=>{resolve(json)})
		 .catch(error=>{reject(error)})
	})
}	


	function makeAccountOption(acntList){
		let acntTitlehtmls='';
		let acntNumhtmls='';
		acntList.forEach(function(each){
			console.log('어카운트 리스트 for문')
		 	acntTitlehtmls+=`<option value='`+each.acntTitle+`' label='`+each.acntNum+`'>`
		 	acntNumhtmls+=`<option value='`+each.acntNum+`' label='`+each.acntTitle+`'>`
		 })
	 	$('#titleList').html(acntTitlehtmls)
	 	$('#numList').html(acntNumhtmls)
	}
	
	//,리스트, 밸류, 레이블, 출력할 타켓 넣어서 데이터리스트 들어갈 옵션 만들기
	function makeOptions(jsonlist,valueName,labelName,target){
		let htmls='';
		jsonlist.forEach(function(each){
		 	htmls+=`<option value='`+each[valueName]+`' label='`+each[labelName]+`'>`
		 })
	 	$(target).html(htmls)
	}
	
	
// 정렬하기 onclick="sortList(this,'prodOrder','orderDate')" class="sorted"
function sortList(self,stand,field){
	var thisclass=self.classList[0] ;
	if(thisclass=='sorted'){
		resultlist.sort(function(a,b){
			return a[stand][field] < b[stand][field] ? -1 : a[stand][field] > b[stand][field] ? 1 : 0;
			})
		self.classList.add('reversed');
		self.classList.remove('sorted');
	}else{
		resultlist.sort(function(a,b){
			return a[stand][field] < b[stand][field] ? 1 : a[stand][field] > b[stand][field] ? -1 : 0;
			})
		self.classList.add('sorted');
		self.classList.remove('reversed');
	}
	console.log(resultlist)
	document.querySelector('.contents tbody').innerHTML=htmlPrint(resultlist);
}

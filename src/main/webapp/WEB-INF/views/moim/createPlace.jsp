<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 생성_장소 설정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/moim/createPlace.css" />
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>

		<!-- Menu -->
		<%@ include file="/WEB-INF/views/inc/menu.jsp"%>

		<!-- Banner -->
		<section id="banner" data-video="/resources/assets/css/images/banner">
			<div class="inner">
				<header>
					<h1>모임 장소 설정</h1>
				</header>
			</div>
			<c:if test="${session.userid != null}">
				<a href="#wrapper" class="more">Learn More</a>
			</c:if>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>

		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<section id="main" class="main">
				<div class="inner">
					<header class="major">
						<h1>Welcome</h1>
					</header>
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 50px; float: left; margin-top: 20px;">모임
								생성</div>
							<div style="font-size: 20px; float: right; margin-top: 40px;">
								<span style="font-weight: bold; color: #579AB7">① 모임 장소
									설정 </span> &nbsp;&#187; <span> ② 모임 정보 입력</span> &nbsp;&#187; <span>
									③ 모임 생성 완료</span>
							</div>
						</div>
					</div>
					<hr>
					<br>
					<div style="margin: 10px; text-align: center;">
						<h3>① 원하는 장소를 검색한 후 아래 목록에서 선택해주세요.</h3>
					</div>
					<br>
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										<b style="color: black; font-weight: bold;">검색어를 입력해 주세요.</b><input
											type="text" value="롯데월드" id="keyword" size="15"
											style="color: black; font-weight: bold;">
										<button type="submit"
											style="font-weight: bold; width: 60px; margin: 5px; border: 2px solid #8ED3EF; color: deepskyblue;">검색</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
					<div>
						<hr>
						<div style="margin: 10px; text-align: center;">
							<h3>② 정확한 위치를 설정하기 위해 지도를 클릭해 좌표를 설정해 주세요.</h3>
						</div>
						<div id="clickLatlng1"
							style="display: none; margin: 20px; text-align: center; font-weight: bold; color: #6C747C;">위도
							: 선택 안함</div>
						<div id="clickLatlng2"
							style="display: none; margin: 20px; text-align: center; font-weight: bold; color: #6C747C;">경도
							: 선택 안함</div>
						<br>
					</div>
					<div style="height: 150px; text-align: center;">
						<div id="div2">
							<input id="btnr" type="button" value="현재 선택된 좌표 등록"
								onclick="savelat();"
								style="border: 2px solid #8ED3EF; font-weight: bold;">
						</div>
					</div>
					<hr>
					<form action="/moim/createPlace" name="placeform" method="post"
						onsubmit="return sendPlace()">
						<input type="hidden" id="placelat" name="placelat" value="">
						<input type="hidden" id="placelng" name="placelng" value="">
						<input type="hidden" id="placename" name="placename" value="">
						<input type="hidden" id="placeroadaddr" name="placeroadaddr"
							value=""> <input type="hidden" id="placeaddr"
							name="placeaddr" value=""> <input type="hidden"
							id="placecategoryname" name="placecategoryname" value="">
						<input type="hidden" id="placephone" name="placephone" value="">

						<div style="text-align: center;">
							<div style="width: 100%; display: inline-block;">
								<input type="button" id="gohome" value="홈으로"
									style="float: left;" onclick="location.href='/index'"
									class="button primary"> <input type="submit"
									value="다음 단계" style="float: right;" class="button primary">
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>

</body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=608550f7326ed470642f95701b5d006a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 마커를 담을 배열입니다
	var markers = [];
	var marker = new kakao.maps.Marker({}); 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 19 // 지도의 확대 레벨
	    };  
	
	// 클릭한 장소 담을 변수
	var placename;
	var roadaddress;
	var address;
	var addressname;
	var addressphone;
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	  
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	//클릭한 좌표 담을 변수
	var getLat;
	var getLng;
	
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		marker.setMap(map);
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message1 = '<span id="getLat" style="display:none">' + latlng.getLat() + '</span>';
	    var message2 = '<span id="getLng" style="display:none">' + latlng.getLng() + '</span>';
	    
	    
	    var resultDiv1 = document.getElementById('clickLatlng1'); 
	    var resultDiv2 = document.getElementById('clickLatlng2'); 
	    resultDiv1.innerHTML = message1;
	    resultDiv2.innerHTML = message2;
	});
		
	function savelat(){
		if(document.getElementById('clickLatlng1').innerText == "위도 : 선택 안함"){
			alert("지도를 클릭해 좌표를 설정해 주세요.");
		}else{
			alert("좌표를 등록했습니다.");
			
			getLat = document.getElementById("getLat").innerText;
			getLng = document.getElementById("getLng").innerText;
			document.getElementById('placelat').setAttribute('value', getLat);
			document.getElementById('placelng').setAttribute('value', getLng);
		}	
	}
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
		
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		
	    var el = document.createElement('li'),
	    itemStr = '<span class="label markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="label info">' +
	                '<h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '<span id="roadaddress" class="label">' + places.road_address_name + '</span>' +
	                    '<span class="label jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '<span class="label">' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '<span class="label tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	
	    
	    el.addEventListener('click', function() {
	    	alert("장소를 선택했습니다.");
	    	
	    		document.getElementById('placename').setAttribute('value', places.place_name);
	    	if(places.road_address_name){
	    		document.getElementById('placeroadaddr').setAttribute('value', places.road_address_name);
	    		document.getElementById('placeaddr').setAttribute('value', places.address_name);
	    	} else{
	    		document.getElementById('placeaddr').setAttribute('value', places.address_name);
	    	}										    	
	    		document.getElementById('placecategoryname').setAttribute('value', places.category_name);
	    		document.getElementById('placephone').setAttribute('value', places.phone);
	    });
	    return el;
	}
	
	
	
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	function displayInfowindow(marker, title) {}
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}			
	
	function sendPlace(){
		let placeform = document.placeform;
		let placelat = placeform.placelat;
		let placelng = placeform.placelng;
		let placename = placeform.placename;
		let placeaddr = placeform.placeaddr;
	
		if(placename.value == ""){
			alert("모임 장소를 검색 후 선택해주세요.");
			return false;
		}
		if(placeaddr.value == ""){
			alert("모임 장소를 검색 후  목록에서 선택해주세요.");
			return false;
		}
		if(placelat.value == "" || placelng.value == ""){
			alert("좌표를 선택한 후 확인 버튼을 눌러주세요.");
			return false;
		}
		return true;
	}
</script>
</html>
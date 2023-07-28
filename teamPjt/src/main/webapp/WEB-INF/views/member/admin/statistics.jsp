<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>statistics</title>
    <link rel="stylesheet" href="./css/admin.css">
</head>


    <body style="">
    
    <!-- 헤더 -->
	<%@ include file="../../common/header.jsp" %>
    
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M24ZFBJ" height="0" width="0"
                title="googletagmanager-iframe" style="display:none;visibility:hidden"></iframe></noscript>
        <div id="fb-root" class=" fb_reset">
            <script async="" src="https://connect.facebook.net/en_US/all.js"></script>
            <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
                <div></div>
            </div>
        </div>
       
        <script src="/static/js/common.js"></script>
        <div id="__next" data-reactroot="">
            <div>
                <div class=""></div>
                <div id="gnbBgColor">
                </div>
                <div id="contents">
                    <div class="container sub_title">
                        <div class="tit">ADMIN</div>
                    </div>
                    <div class="container mypage_wrap">
                        <div class="mypage_myinfo">
                            <!-- =================================== admin  =================================== -->
                            <div class="tit"> 관리자</div>
                            <div class="my-count" role="link" tabindex="0">USER MANAGEMENT</div>
                        </div>
                        <div class="newmypage_menu pc_only">
                            <ul>
                                <li class=""><a href="./stayadmin">숙소 관리</a></li>
                                <li class=""><a href="./useradmin">사용자 관리 </a></li>
                                <li class=""><a href="./hosthelp">호스트 지원</a></li>
                                <li class="active"><a href="/admin/statistics">통계 및 분석</a></li>
                            </ul>
                        </div>
                        <div class="mypage_content">
                            <div class="reserv_wrap mypage-reservation-info">
                                <div class="reserv_box accepted">
                                    <!-- 차트 js -->
                             
                             			
                             			
                             			    <div class="container">
										        <div class="row my-3">
										            <div class="col-12">
										                <h5>연령대별 조회</h5>
										            </div>
										        </div>
										        <div class="row my-2">
										            <div class="col-lg-6">
										                <div class="card">
										                    <div class="card-body">
										                        <canvas id="myChart1"></canvas>
										                    </div>
										                    <div class="card-footer text-center text-dark">
										                      <h3>Pie</h3>
										                    </div>
										                </div>
										            </div>
										        </div>
										    </div>
											  <!-- 부트스트랩 -->
											  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
											    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
											    crossorigin="anonymous"></script>
											  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
											    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
											    crossorigin="anonymous"></script>
											  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
											    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
											    crossorigin="anonymous"></script>
											  <!-- 차트 -->
											  <script>
											  data = {
											        datasets: [{
											            backgroundColor: [' rgba(243, 189, 189, 0.863)',' rgb(245, 245, 200)','rgb(170, 218, 233)'],
											            data: [50, 20, 30]
											        }],       
											        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
											        labels: ['20대','30대','40대 이상'] 
											    };
											
											  // 가운데 구멍이 없는 파이형 차트
											  var ctx1 = document.getElementById("myChart1");
											  var myPieChart = new Chart(ctx1, {
											      type: 'pie',
											      data: data,
											      options: {}
											  });
											  </script>
											                             			
											  <script>
											// AJAX 호출을 통해 JSON 데이터를 받아와서 처리하는 함수
											function fetchData() {
											  fetch('/getMember') // API 엔드포인트 호출
											    .then(response => response.json()) // JSON 데이터로 파싱
											    .then(data => {
											      console.log(data); // JSON 데이터를 콘솔에 출력하거나 원하는 처리를 수행
											      // 여기서 data를 이용하여 차트를 그리는 등의 작업을 수행할 수 있습니다.
											    })
											    .catch(error => {
											      console.error('Error fetching data:', error);
											    });
											}
											
											// 함수 호출
											fetchData();
											</script>      			
                             			
                             			
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                
            </div><button class="custom-button-1"></button>
        </div>
        
        <!-- 푸터 -->
		<%@ include file="../../common/footer.jsp" %>
		
    </body>
</html>
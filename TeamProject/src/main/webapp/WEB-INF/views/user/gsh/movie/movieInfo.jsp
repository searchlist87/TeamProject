<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

<div>
<div class="tit-heading-wrap">
    <h3>영화상세</h3>
</div>
<div class="sect-base-movie">
    <h3><strong>반도</strong>기본정보</h3>
    <div class="box-image">
        <a href="" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83160/83160_320.jpg" alt="반도 포스터 새창" onerror="errorImage(this)">
                <span class="ico-posterdetail">포스터 크게 보기</span>
                <span class="ico-grade grade-15"> 15세 이상</span>
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>반도</strong>
            <em class="round lightblue"><span>현재상영중</span></em>
            
            
            <p>Peninsula</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>92.0%</span></strong>
            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->            
            <div class="egg-gage small">
                                            <span class="egg good"></span>
                                            <span class="percent">78%</span>
                                        </div>
        </div>
        <!-- 떨어지는 얘 이전 요소에 class=on을 넣는다 -->
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <dd>
                    
                        
                        <a href="">연상호</a>                    
                        
                </dd>
                <dt>&nbsp;/ 프로듀서 :&nbsp;</dt>
                <dd>
                    
                        
                        김연호                 
                        
                </dd>

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                    
                        
                        <a href="">강동원</a>                    
                        
                        ,&nbsp;
                        <a href="">이정현</a>                    
                        
                </dd>

                <dt>장르 :&nbsp;액션,&nbsp;드라마</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                <dd class="on">15세 이상,&nbsp;116분,&nbsp;한국</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">2020.07.15</dd>


            
                <dt>공식사이트&nbsp;:&nbsp;</dt>
                <dd><a href="" target="_blank" title="새창"> www.bando2020.kr</a></dd>
            

            </dl>
        </div>
        <span class="screentype">
        
                <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
            
                <a href="#" class="forDX" title="4DX 상세정보 바로가기" data-regioncode="4D14">4DX</a>
            
        </span>

        <span class="like">
            <!-- 2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
            <a class="link-count" href="javascript:void (0);"><i class="sprite_preegg btn_md default"></i>프리에그</a>
        
            <a class="link-reservation" href="">예매</a> 
        
        </span>

    </div>
</div><!-- .sect-base -->

<script>
    // 기대돼요, 글쎄요 클릭시 css 변경
    $('.movie-pre-select .wrap_btn .btn').on('click', function () {
        if ($(this).hasClass("selected") == true) {
            $(this).removeClass('selected');
        }
        else {
            $(this).addClass('selected').siblings().removeClass('selected');
        }
    });

    // 확인 버튼 클릭시
    $("#btnSave").on('click', function () {
        var movieIdx = "83160";
        var selectvalue = "";                 // 이미 선택된 값(비교대상)
      
        if ($(".wrap_btn .good").hasClass("selected") == true) {
            selectvalue = "Y";
        }
        if ($(".wrap_btn .bad").hasClass("selected") == true) {
            selectvalue = "W";
        }

        if ($("#preegg_useyn").val() == selectvalue) {
            if ($("#preegg_useyn").val() == "" && selectvalue == "") {
                alert("프리에그를 선택하지 않았습니다.\n'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.");
            }
            else { 
                alert("수정된 내용이 없습니다.");
            }
            $("#movie-pre-select").css("display", "none");      // 기존값과 동일하면 저장하지 않고 팝업창 닫음
        }
        else {
            $.ajax({
                type: "POST",
                url: '/common/ajax/movies.aspx/AddPreEggMovie',
                data: "{'movieIdx':'" + movieIdx + "', 'useYN':'" + selectvalue + "', 'title':'반도'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: 'json',
                success: function (result) {
                    var JObject = JSON.parse(result.d.toString());

                    switch (JObject["resultCode"]) {
                        case "-1": // 로그인 필요
                            app.goLogin();
                            break;
                        case "1":
                            // 성공
                            if ($("#preegg_useyn").val() == "Y" && (selectvalue == "W" || selectvalue == "")) {
                                alert("'기대되는 영화'에서 삭제되었습니다.");
                            }
                            else if (selectvalue == "Y") {
                                if (confirm("'기대되는 영화'에 등록되었습니다.\n'기대되는 영화'로 이동하시겠습니까?") == true) {
                                    location.href = "/user/movielog/";
                                }
                            }
                            else if ($("#preegg_useyn").val() == "" && selectvalue == "W") {
                                alert("'글쎄요'로 등록되었습니다.");
                            }
                            else if ($("#preegg_useyn").val() == "W" && selectvalue == "") {
                                alert("프리에그를 선택하지 않았습니다.\n'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.");
                            }
                            else if ($("#preegg_useyn").val() == "" && selectvalue == "") {
                                alert("프리에그를 선택하지 않았습니다.\n'기대돼요!'를 선택하시면 '기대되는 영화'에 추가됩니다.");
                            }

                            $("#preegg_useyn").val(selectvalue);
                            $(".like .link-count").removeClass("favor").removeClass("hate");

                            if(selectvalue == "Y")
                                $(".like .link-count").addClass("favor").html("<i class=\"sprite_preegg btn_md favor\"></i>프리에그");
                            else if (selectvalue == "W")
                                $(".like .link-count").addClass("hate").html("<i class=\"sprite_preegg btn_md hate\"></i>프리에그");
                            else 
                                $(".like .link-count").html("<i class=\"sprite_preegg btn_md default\"></i>프리에그");

                            $("#movie-pre-select").css("display", "none");

                            break;
                        default:
                            //   alert('Error result Value : ' + result);                    
                            break;
                    }
                }
            });
        }
    });
</script>

    <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
            <ul class="tab-menu">
                <li class="on"><a title="현재 선택됨" href="/movies/detail-view/?midx=83160#menu">주요정보 </a></li>             
                <li><a href="/movies/detail-view/trailer.aspx?midx=83160#menu">트레일러</a></li>
                <li><a href="/movies/detail-view/still-cut.aspx?midx=83160#menu">스틸컷</a></li>
                <li><a href="/movies/detail-view/?midx=83160#commentReg">평점/리뷰</a></li>               
                <li class="last"><a href="/movies/detail-view/show-times.aspx?midx=83160#menu">상영시간표</a></li>
            </ul>
            <div class="sect-story-movie">
                <p><strong>전대미문의 재난 그 후 4년<br>
폐허의 땅으로 다시 들어간다!</strong><br>
<br>
4년 전, 나라 전체를 휩쓸어버린 전대미문의 재난에서 가까스로 탈출했던 ‘정석’(강동원).<br>
바깥세상으로부터 철저히 고립된 반도에 다시 들어가야 하는 피할 수 없는 제안을 받는다.<br>
<br>
제한 시간 내에 지정된 트럭을 확보해 반도를 빠져 나와야 하는 미션을 수행하던 중<br>
인간성을 상실한 631부대와 4년 전보다 더욱 거세진 대규모 좀비 무리가 정석 일행을 습격한다.<br>
<br>
절체절명의 순간,<br>
폐허가 된 땅에서 살아남은 ‘민정’(이정현) 가족의 도움으로 위기를 가까스로 모면하고<br>
이들과 함께 반도를 탈출할 수 있는 마지막 기회를 잡기로 한다.<br>
<br>
<strong>되돌아온 자, 살아남은 자 그리고 미쳐버린 자<br>
필사의 사투가 시작된다!</strong></p>
            </div>
            <!-- .sect-story -->
            <!-- 2020.05.07 성별예매분포, 연령별예매분포 UI 변경 -->
            <div id="ctl00_PlaceHolderContent_Section_Chart" class="sect-graph sect-graph-emotion">
                <ul class="graph">
                    <li>
                        <strong>성별 예매 분포</strong>
                        <div id="jqplot_sex" class="chart jqplot-target" style="position: relative;"><canvas width="400" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;"></div><canvas width="400" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><canvas width="380" height="159" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; top: 10px;"></canvas><canvas width="380" height="159" class="jqplot-series-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas><canvas width="380" height="159" class="jqplot-donutRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas><span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 111px; top: 142px;">남 43.2%</span><span class="jqplot-donut-series jqplot-data-label" style="position: absolute; left: 239px; top: 22px;">여 56.8%</span><canvas width="380" height="159" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas></div>
                    </li>
                    <li>
                        <strong>연령별 예매 분포</strong>
                        <div id="jqplot_age" class="chart jqplot-target" style="position: relative;"><canvas width="400" height="192" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;"></div><div class="jqplot-axis jqplot-xaxis" style="position: absolute; width: 400px; height: 14px; left: 0px; bottom: 0px;"><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 35.5px;">10대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 111.5px;">20대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 187.5px;">30대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 263.5px;">40대</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 12px; left: 339.5px;">50대</div></div><div class="jqplot-axis jqplot-yaxis" style="position: absolute; height: 192px; width: 0px; left: 0px; top: 0px;"></div><canvas width="400" height="192" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><canvas width="380" height="158" class="jqplot-series-shadowCanvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas><canvas width="380" height="158" class="jqplot-series-canvas" style="position: absolute; left: 10px; display: block; top: 10px;"></canvas><div class="jqplot-point-label jqplot-series-0 jqplot-point-4" style="position: absolute; left: 342.5px; top: 108.13px; display: block;">10.6</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-3" style="position: absolute; left: 266.5px; top: 61.915px; display: block;">22.3</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-2" style="position: absolute; left: 190.5px; top: 41.77px; display: block;">27.4</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-1" style="position: absolute; left: 114.5px; top: 5.825px; display: block;">36.5</div><div class="jqplot-point-label jqplot-series-0 jqplot-point-0" style="position: absolute; left: 41px; top: 137.755px; display: block;">3.1</div><canvas width="380" height="158" class="jqplot-barRenderer-highlight-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas><canvas width="380" height="158" class="jqplot-event-canvas" style="position: absolute; left: 10px; top: 10px;"></canvas></div>
                    </li>
                </ul>
            </div>
            <!-- .sect-graph -->

            <div class="movie-detail-ad">
                <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_800" width="800" height="90" title="광고-반도" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_800" id="SponsorBar_800"></iframe>
            </div>
            <!-- .sect-staff -->
            <div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
                    <h4>트레일러</h4><span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">6건</span><a class="link-more" href="trailer.aspx?midx=83160">더보기</a>
                </div>
                <ul>
                <!-- 사진 동영상 조회 -->
                
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="181363">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Trailer/83160/83160181363_1024.jpg" alt="[반도]NO스포일러 예고편" onerror="errorImage(this, {'type':'landscape'})">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="181363">
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    NO스포일러 예고편
                                </strong>
                            </a>
                            <span class="txt-info">2020.07.14</span>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="181343">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Trailer/83160/83160181343_1024.jpg" alt="[반도]리뷰 30초 예고편" onerror="errorImage(this, {'type':'landscape'})">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="181343">
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    리뷰 30초 예고편
                                </strong>
                            </a>
                            <span class="txt-info">2020.07.14</span>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="181318">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Trailer/83160/83160181318_1024.jpg" alt="[반도]메이킹 예고편" onerror="errorImage(this, {'type':'landscape'})">
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="181318">
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    메이킹 예고편
                                </strong>
                            </a>
                            <span class="txt-info">2020.07.13</span>
                        </div>
                    </li>
                    
                </ul>
            </div><!-- .sect-trailer -->
            <div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current">1</strong>/34건</span><a class="link-more" href="still-cut.aspx?midx=83160">더보기</a>
                </div>
                <div class="slider-wrap">
                    <div class="slider" id="still_motion">
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181034_727.jpg" alt="반도" onerror="errorImage(this)" src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181034_727.jpg" style="margin-top: 22.5px;">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181033_727.jpg" alt="반도" onerror="errorImage(this)" src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181033_727.jpg" style="margin-top: 22.5px;">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181032_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181031_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181030_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181029_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181028_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181027_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181026_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181025_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181024_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181023_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181022_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160181021_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180913_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180808_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180807_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180218_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180217_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180216_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180215_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180214_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180213_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180099_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180098_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180064_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180063_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180018_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160180017_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160178142_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160178141_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160177906_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160177550_727.jpg" alt="반도" onerror="errorImage(this)">
                            </div>
                        </div>
                        
                        <div class="item-wrap">
                            <div class="item" style="width: 800px; height: 450px; display: none;">
                                <img data-src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160177549_727.jpg" alt="반도" onerror="errorImage(this)" src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000083/83160/83160177549_727.jpg" style="height: 100%;">
                            </div>
                        </div>
                        
                        <button type="button" class="btn-prev">이전 페이지 이동</button>
                        <button type="button" class="btn-next">다음 페이지 이동</button>
                    </div>
                </div>
            </div><!-- .sect-stillcut -->


              
    
            <div class="sect-grade">   
                <!-- preegg.css 연관 UI -->
                <div class="movie_grade">
                    <a class="info" id="goldenEggAlert" href="javascript:void(0);"><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico-question-mark.png" alt="?"></a>
                    <div class="egg_point">
                        <!-- 영화요약문구 -->
                        <div class="title">배우들의 연기가 돋보이고<br>몰입하여 보게 되는 영화</div>
                        <div class="rating">
                            <div class="box">
                                <span class="sprite_preegg big default"></span>
                                <span class="desc">Pre Egg</span>
                                <span class="percent">97%</span>
                                <span class="tooltip">사전기대지수</span>
                            </div>
                            <div class="box box_golden">
                                <span class="sprite_preegg big good"></span>
                                <span class="desc">Golden Egg</span>
                                <span class="percent">78%</span>
                                <span class="tooltip">실관람평지수</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="chart_total">
                        <div class="box">
                            <div class="title">매력 포인트</div>
                            <div class="radar-graph" id="chart2">
                                <div id="charm" style="width: 350px; height: 250px; margin: 0px auto; overflow: hidden; text-align: left;"><div class="amcharts-main-div" style="position: relative;"><div class="amcharts-chart-div" style="overflow: hidden; position: relative; text-align: left; width: 350px; height: 250px; padding: 0px; touch-action: auto;"><svg version="1.1" style="position: absolute; width: 350px; height: 250px; top: 0px; left: 0px;"><g><path cs="100,100" d="M0.5,0.5 L349.5,0.5 L349.5,249.5 L0.5,249.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path></g><g><g transform="translate(175,125)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="middle" transform="translate(0,-102)"><tspan y="6" x="0">감독연출</tspan></text><path cs="100,100" d="M0.5,0.5 L83.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(98,-30)"><tspan y="6" x="0">스토리</tspan></text><path cs="100,100" d="M0.5,0.5 L51.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(62,79)"><tspan y="6" x="0">영상미</tspan></text><path cs="100,100" d="M0.5,0.5 L-50.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-62,79)"><tspan y="6" x="0">배우연기</tspan></text><path cs="100,100" d="M0.5,0.5 L-82.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-98,-30)"><tspan y="6" x="0">OST</tspan></text></g></g><g><g transform="translate(175,125)" visibility="visible"><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-16.5 L17.5,-4.5 L10.5,14.5 L-9.5,14.5 L-16.5,-4.5 L0.5,-16.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-33.5 L33.5,-10.5 L20.5,28.5 L-19.5,28.5 L-32.5,-10.5 L0.5,-33.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-51.5 L50.5,-15.5 L31.5,42.5 L-30.5,42.5 L-49.5,-15.5 L0.5,-51.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-68.5 L66.5,-20.5 L41.5,56.5 L-40.5,56.5 L-65.5,-20.5 L0.5,-68.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-86.5 L83.5,-26.5 L51.5,71.5 L-50.5,71.5 L-82.5,-26.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L-0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,1.5 L-0.5,1.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 Z" fill="#000000" stroke="#000000" fill-opacity="0.1" stroke-width="0.01" stroke-opacity="0.1"></path></g></g></g><desc>JavaScript chart by amCharts 3.21.8</desc><g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><g></g><g><path cs="100,100" d="M0.5,-30.125 L24.63306,-7.34131 L27.24423,37.31027 L-32.41597,45.80495 L-11.98262,-3.5558500000000004 L0.5,-30.125 M0,0 L0,0" fill="none" stroke-width="1" stroke-opacity="1" stroke="#fb8c43" stroke-linejoin="round"></path><path cs="100,100" d="M0.5,-30.125 L24.63306,-7.34131 L27.24423,37.31027 L-32.41597,45.80495 L-11.98262,-3.5558500000000004 L0.5,-30.125 L0.5,0.5 Z" fill="#fb8c43" stroke="#000" fill-opacity="0.1" stroke-width="1" stroke-opacity="0"></path></g><g></g></g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><circle r="3.5" cx="0" cy="0" fill="rgb(255,133,179)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,-31)" aria-label=" 감독연출 35"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(254,196,70)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(24,-8)" aria-label=" 스토리 29"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(142,189,255)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(27,37)" aria-label=" 영상미 52"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(100,169,178)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(-33,45)" aria-label=" 배우연기 64"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(178,103,183)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(-12,-4)" aria-label=" OST 15"></circle></g></g><g><g></g></g><g><g transform="translate(175,125)" visibility="visible"><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,-8)"><tspan y="6" x="0"></tspan></text><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,1)"><tspan y="6" x="0"></tspan></text></g></g><g></g><g></g><g></g><g></g></svg></div></div></div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="title">감정 포인트</div>
                            <div class="radar-graph" id="chart3">
                                <div id="emotion" style="width: 350px; height: 250px; margin: 0px auto; overflow: hidden; text-align: left;"><div class="amcharts-main-div" style="position: relative;"><div class="amcharts-chart-div" style="overflow: hidden; position: relative; text-align: left; width: 350px; height: 250px; padding: 0px; touch-action: auto;"><svg version="1.1" style="position: absolute; width: 350px; height: 250px; top: 0px; left: -0.5px;"><g><path cs="100,100" d="M0.5,0.5 L349.5,0.5 L349.5,249.5 L0.5,249.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path></g><g><g transform="translate(175,125)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="middle" transform="translate(0,-102)"><tspan y="6" x="0">스트레스 해소</tspan></text><path cs="100,100" d="M0.5,0.5 L83.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(98,-30)"><tspan y="6" x="0">즐거움</tspan></text><path cs="100,100" d="M0.5,0.5 L51.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="start" transform="translate(62,79)"><tspan y="6" x="0">긴장감</tspan></text><path cs="100,100" d="M0.5,0.5 L-50.5,71.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-62,79)"><tspan y="6" x="0">몰입감</tspan></text><path cs="100,100" d="M0.5,0.5 L-82.5,-26.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-98,-30)"><tspan y="6" x="0">감동</tspan></text></g></g><g><g transform="translate(175,125)" visibility="visible"><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-16.5 L17.5,-4.5 L10.5,14.5 L-9.5,14.5 L-16.5,-4.5 L0.5,-16.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-33.5 L33.5,-10.5 L20.5,28.5 L-19.5,28.5 L-32.5,-10.5 L0.5,-33.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-51.5 L50.5,-15.5 L31.5,42.5 L-30.5,42.5 L-49.5,-15.5 L0.5,-51.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-68.5 L66.5,-20.5 L41.5,56.5 L-40.5,56.5 L-65.5,-20.5 L0.5,-68.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-86.5 L83.5,-26.5 L51.5,71.5 L-50.5,71.5 L-82.5,-26.5 L0.5,-86.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L-0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,1.5 L-0.5,1.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.15" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,-7.5 L8.5,-2.5 L5.5,7.5 L-4.5,7.5 L-7.5,-2.5 L0.5,-7.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 L0.5,0.5 Z" fill="#000000" stroke="#000000" fill-opacity="0.1" stroke-width="0.01" stroke-opacity="0.1"></path></g></g></g><desc>JavaScript chart by amCharts 3.21.8</desc><g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><g></g><g><path cs="100,100" d="M0.5,-39.75 L15.47914,-4.36702 L27.24423,37.31027 L-26.75854,38.01816 L-16.14349,-4.9078 L0.5,-39.75 M0,0 L0,0" fill="none" stroke-width="1" stroke-opacity="1" stroke="#FB4357" stroke-linejoin="round"></path><path cs="100,100" d="M0.5,-39.75 L15.47914,-4.36702 L27.24423,37.31027 L-26.75854,38.01816 L-16.14349,-4.9078 L0.5,-39.75 L0.5,0.5 Z" fill="#FB4357" stroke="#000" fill-opacity="0.1" stroke-width="1" stroke-opacity="0"></path></g><g></g></g></g><g></g><g></g><g></g><g><g transform="translate(175,125)"><circle r="3.5" cx="0" cy="0" fill="rgb(255,133,179)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(0,-40)" aria-label=" 스트레스 해소 46"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(254,196,70)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(15,-5)" aria-label=" 즐거움 18"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(142,189,255)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(27,37)" aria-label=" 긴장감 52"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(100,169,178)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(-27,38)" aria-label=" 몰입감 53"></circle><circle r="3.5" cx="0" cy="0" fill="rgb(178,103,183)" stroke="rgb(255,255,255)" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(-17,-5)" aria-label=" 감동 20"></circle></g></g><g><g></g></g><g><g transform="translate(175,125)" visibility="visible"><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,-8)"><tspan y="6" x="0"></tspan></text><text y="6" fill="rgb(0,0,0)" font-family="CJONLYONENEW" font-size="12px" opacity="1" text-anchor="end" transform="translate(-4,1)"><tspan y="6" x="0"></tspan></text></g></g><g></g><g></g><g></g><g></g></svg></div></div></div>
                            </div>
                        </div>
                    </div>

                    <!-- Chart code -->
                    <script>
   
                        // 2020.05.07 매력포인트 차트
                        var chart = AmCharts.makeChart("charm", {
                            "type": "radar",
                            "radius": "35%", //넓이

                            "dataProvider": [{
                                "key": "감독연출",
                                "value": 35,
                                "color": "rgb(255,133,179)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "스토리",
                                "value": 29,
                                "color": "rgb(254,196,70)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "영상미",
                                "value": 52,
                                "color": "rgb(142,189,255)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "배우연기",
                                "value": 64,
                                "color": "rgb(100,169,178)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "OST",
                                "value": 15,
                                "color": "rgb(178,103,183)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }],
                            "valueAxes": [{
                                "axisTitleOffset": 10,
                                "minimum": 0,
                                "maximum": 100,
                                "axisAlpha": 0.15,
                                "unitPosition": "right",
                                "gridColor": "#000000",
                                "autoGridCount": false,
                                "gridCount": 5,
                                "labelsEnabled" : false,
                                "tickLength" : 1
                            }],
                            "guides": [
                                {
                                    "fillAlpha": 0.10,
                                    "value": 0,
                                    "toValue": 10,
                                    "color": "#060"
                                }
                            ],
                            "balloon": {
                                "enabled": false
                            },
                            "startDuration": 0,
                            "graphs": [{
                                "bullet": "round",
                                "bulletSize": 7,
                                "bulletBorderAlpha": "1",
                                "bulletBorderColor": "rgb(255,255,255)",
                                "bulletBorderThickness": "1",
                                "lineThickness": 1,
                                "lineColor": "#fb8c43",
                                "fillAlphas": 0.1,
                                "valueField": "value",
                                "lineColorField": "color"
                            }],
                            "categoryField": "key",
                            "export": {
                                "enabled": false
                            },
                            "autoResize": false,
                            "color": "rgb(0,0,0)",
                            "fontSize": 12,
                            "fontFamily": "CJONLYONENEW",
                            "tapToActivate": false,
                            "rollOverGraphItem": function () {
                                console.log('rollOverGraphItem')

                            }
                        });

                        // 2020.05.07 감정포인트 차트(7시방향 1번째, 12시 방향이 3번째 순서로 3번째항목부터 데이터 셋팅)
                        var chart = AmCharts.makeChart("emotion", {
                            "type": "radar",
                            "radius": "35%", //넓이

                            "dataProvider": [{
                                "key": "스트레스 해소",
                                "value": 46,
                                "color": "rgb(255,133,179)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "즐거움",
                                "value": 18,
                                "color": "rgb(254,196,70)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "긴장감",
                                "value": 52,
                                "color": "rgb(142,189,255)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "몰입감",
                                "value": 53,
                                "color": "rgb(100,169,178)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }, {
                                "key": "감동",
                                "value": 20,
                                "color": "rgb(178,103,183)",
                                "rollOverColor" : "rgb(0,0,0)",
                                "selectedColor" : "rgb(0,0,0)",
                            }],
                            "valueAxes": [{
                                "axisTitleOffset": 10,
                                "minimum": 0,
                                "maximum": 100,
                                "axisAlpha": 0.15,
                                "unitPosition": "right",
                                "gridColor": "#000000",
                                "autoGridCount": false,
                                "gridCount": 5,
                                "labelsEnabled" : false,
                                "tickLength" : 1
                            }],
                            "guides": [
                                {
                                    "fillAlpha": 0.10,
                                    "value": 0,
                                    "toValue": 10,
                                    "color": "#060"
                                }
                            ],
                            "balloon": {
                                "enabled": false
                            },
                            "startDuration": 0,
                            "graphs": [{
                                "bullet": "round",
                                "bulletSize": 7,
                                "bulletBorderAlpha": "1",
                                "bulletBorderColor": "rgb(255,255,255)",
                                "bulletBorderThickness": "1",
                                "lineThickness": 1,
                                "lineColor": "#FB4357",
                                "fillAlphas": 0.1,
                                "valueField": "value",
                                "lineColorField": "color"
                            }],
                            "categoryField": "key",
                            "export": {
                                "enabled": false
                            },
                            "autoResize": false,
                            "color": "rgb(0,0,0)",
                            "fontSize": 12,
                            "fontFamily": "CJONLYONENEW",
                            "tapToActivate": false,
                            "rollOverGraphItem": function () {
                                console.log('rollOverGraphItem')
                            }
                        });
                    </script>

                </div>
                <div class="real-rating">
                    <p class="title">관람일 포함 7일 이내 관람평을 남기시면 <strong>CJ ONE 20P</strong>가 적립됩니다. </p>
                    <p class="desc"><span><em>1,733</em> 명의 실관람객이 평가해주셨습니다.</span></p>
                    <div class="wrap_btn">
                        <a class="link-gradewrite" href="javascript:void(0);"><span>평점작성</span></a><a class="link-reviewwrite" href="/movies/point/my-list.aspx"><span>내 평점</span></a>
                    </div>
                </div>
                <!-- //preegg.css 연관 UI -->
                <ul class="sort" id="sortTab">
                    <li class="sortTab on" data-order-type="0" id="test"><a href="javascript:void(0);" title="현재선택">최신순<span class="arrow-down"></span></a></li>
                    <li class="sortTab" data-order-type="3"><a href="javascript:void(0);">추천순<span class="arrow-down"></span></a></li>
                </ul>
                                
                <div class="wrap-persongrade">
                    <!-- 평점 목록 -->
                    <ul id="movie_point_list_container" class="point_col2"><li class="" id="liCommentFirst30200970" data-spoilercnt="0" data-reportcnt="0">      <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>     <div class="box-image">         <span class="thumb-image">                    <img src="http://img.cgv.co.kr/MyCGV/Profile/2018/0113/purelamer_123119_M.jpg" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                                             <span class="profile-mask">                 </span>                 <div class="theater-sticker">                                                           </div>                                                              </span>     </div>      <div class="box-contents">         <ul class="writerinfo">              <li class="writer-name"><a href="#select_main" class="commentMore" data-moreuserid="purelamer" data-moreuseridnicname="JulieNY" onclick="getPopList1('purelamer', 'JulieNY')" ;="">             <span class=" egg-icon good "></span>JulieNY</a>         </li>         <li class="writer-etc">                                  <span class="vip">Movie Mania</span>                      <span class="day">2020.07.15</span>     <span class="like point_like" id="purelamer30200970" data-ismygood="false" data-commentidx="30200970">      <a href="javascript:return false;" class="btn_point_like"><span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span><span id="idLikeValue">0</span></a>     </span>    </li>                                         <li class="point_notify">                 <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>                 <div class="notify_wrap">                     <ul>                         <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="30200970" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>                         <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="30200970" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>                     </ul>                 </div>             </li>                                   </ul>     </div>     <div class="box-comment">         <p>강동원은 강동원이다??</p>     </div>                              </li><li class="" id="liCommentFirst30200969" data-spoilercnt="0" data-reportcnt="0">      <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>     <div class="box-image">         <span class="thumb-image">                    <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                                             <span class="profile-mask">                 </span>                 <div class="theater-sticker">                               <span class="fourdx">4DX</span>                              </div>                                                              </span>     </div>      <div class="box-contents">         <ul class="writerinfo">              <li class="writer-name"><a href="#select_main" class="commentMore" data-moreuserid="tpsk1212" data-moreuseridnicname="네나님" onclick="getPopList1('tpsk1212', '네나님')" ;="">             <span class=" egg-icon good "></span>네나님</a>         </li>         <li class="writer-etc">                      <span class="day">2020.07.15</span>     <span class="like point_like" id="tpsk121230200969" data-ismygood="false" data-commentidx="30200969">      <a href="javascript:return false;" class="btn_point_like"><span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span><span id="idLikeValue">0</span></a>     </span>    </li>                                         <li class="point_notify">                 <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>                 <div class="notify_wrap">                     <ul>                         <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="30200969" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>                         <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="30200969" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>                     </ul>                 </div>             </li>                                   </ul>     </div>     <div class="box-comment">         <p>운전하다 끝난듯 간만에 심장쫄깃해졌네요</p>     </div>                              </li><li class="" id="liCommentFirst30200968" data-spoilercnt="0" data-reportcnt="0">      <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>     <div class="box-image">         <span class="thumb-image">                    <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                                             <span class="profile-mask">                 </span>                 <div class="theater-sticker">                               <span class="fourdx">4DX</span>                       <span class="screenx">SCREENX</span>         </div>                                                              </span>     </div>      <div class="box-contents">         <ul class="writerinfo">              <li class="writer-name"><a href="#select_main" class="commentMore" data-moreuserid="p3d1ffjjz" data-moreuseridnicname="p3**ffjjz" onclick="getPopList1('p3d1ffjjz', 'p3**ffjjz')" ;="">             <span class=" egg-icon good "></span>p3**ffjjz</a>         </li>         <li class="writer-etc">                      <span class="day">2020.07.15</span>     <span class="like point_like" id="p3d1ffjjz30200968" data-ismygood="false" data-commentidx="30200968">      <a href="javascript:return false;" class="btn_point_like"><span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span><span id="idLikeValue">0</span></a>     </span>    </li>                                         <li class="point_notify">                 <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>                 <div class="notify_wrap">                     <ul>                         <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="30200968" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>                         <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="30200968" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>                     </ul>                 </div>             </li>                                   </ul>     </div>     <div class="box-comment">         <p>심장 쫄깃해지는 스토리~~</p>     </div>                              </li><li class="" id="liCommentFirst30200967" data-spoilercnt="0" data-reportcnt="0">      <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>     <div class="box-image">         <span class="thumb-image">                    <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                                             <span class="profile-mask">                 </span>                 <div class="theater-sticker">                                                    <span class="screenx">SCREENX</span>         </div>                                                              </span>     </div>      <div class="box-contents">         <ul class="writerinfo">              <li class="writer-name"><a href="#select_main" class="commentMore" data-moreuserid="samsaforever" data-moreuseridnicname="sa**aforever" onclick="getPopList1('samsaforever', 'sa**aforever')" ;="">             <span class=" egg-icon good "></span>sa**aforever</a>         </li>         <li class="writer-etc">                                  <span class="vip">Movie Mania</span>                      <span class="day">2020.07.15</span>     <span class="like point_like" id="samsaforever30200967" data-ismygood="false" data-commentidx="30200967">      <a href="javascript:return false;" class="btn_point_like"><span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span><span id="idLikeValue">0</span></a>     </span>    </li>                                         <li class="point_notify">                 <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>                 <div class="notify_wrap">                     <ul>                         <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="30200967" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>                         <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="30200967" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>                     </ul>                 </div>             </li>                                   </ul>     </div>     <div class="box-comment">         <p>그 조건이면 목숨걸 가치가 충분하다</p>     </div>                              </li><li class="" id="liCommentFirst30200965" data-spoilercnt="0" data-reportcnt="0">      <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>     <div class="box-image">         <span class="thumb-image">                    <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                                             <span class="profile-mask">                 </span>                 <div class="theater-sticker">                                                           </div>                                                              </span>     </div>      <div class="box-contents">         <ul class="writerinfo">              <li class="writer-name"><a href="#select_main" class="commentMore" data-moreuserid="hyelim0718" data-moreuseridnicname="hy**im0718" onclick="getPopList1('hyelim0718', 'hy**im0718')" ;="">             <span class=" egg-icon "></span>hy**im0718</a>         </li>         <li class="writer-etc">                                  <span class="vip">Movie Mania</span>                      <span class="day">2020.07.15</span>     <span class="like point_like" id="hyelim071830200965" data-ismygood="false" data-commentidx="30200965">      <a href="javascript:return false;" class="btn_point_like"><span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span><span id="idLikeValue">0</span></a>     </span>    </li>                                         <li class="point_notify">                 <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>                 <div class="notify_wrap">                     <ul>                         <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="30200965" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>                         <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="30200965" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>                     </ul>                 </div>             </li>                                   </ul>     </div>     <div class="box-comment">         <p>별로임. 넘 신파...후반자동차 액션씬은 매드맥스를 오마주한것인가..?상당히 비슷한 액션씬으로 구성됨.</p>     </div>                              </li><li class="" id="liCommentFirst30200963" data-spoilercnt="0" data-reportcnt="0">      <a href="javascript:return false;" class="screen_spoiler">&nbsp;</a>     <div class="box-image">         <span class="thumb-image">                    <img src="http://img.cgv.co.kr/R2014/images/common/default_profile.gif" alt="사용자 프로필" onerror="errorImage(this, {'type':'profile'})">                                                             <span class="profile-mask">                 </span>                 <div class="theater-sticker">                                                           </div>                                                              </span>     </div>      <div class="box-contents">         <ul class="writerinfo">              <li class="writer-name"><a href="#select_main" class="commentMore" data-moreuserid="ainmqe7" data-moreuseridnicname="ai**qe7" onclick="getPopList1('ainmqe7', 'ai**qe7')" ;="">             <span class=" egg-icon good "></span>ai**qe7</a>         </li>         <li class="writer-etc">                      <span class="day">2020.07.15</span>     <span class="like point_like" id="ainmqe730200963" data-ismygood="false" data-commentidx="30200963">      <a href="javascript:return false;" class="btn_point_like"><span><img src="http://img.cgv.co.kr/R2014/images/point/ico_point_default.png" alt="like" class="like_red"></span><span id="idLikeValue">0</span></a>     </span>    </li>                                         <li class="point_notify">                 <a href="" class="btn_notify">스포일러, 욕설/비방 신고</a>                 <div class="notify_wrap">                     <ul>                         <li><a href="javascript:return false;" class="ico_spoiler" data-commentidx="30200963" data-ismyspoiler="false" data-spoilercnt="0"><span>스포일러 신고</span></a></li>                         <li><a href="javascript:return false;" class="ico_swearword" data-commentidx="30200963" data-ismyreport="false" data-reportcnt="0"><span>욕설/비방 신고</span></a></li>                     </ul>                 </div>             </li>                                   </ul>     </div>     <div class="box-comment">         <p>스릴감 넘치고 강동원 너무 잘생기고 내용도 좋았어요!</p>     </div>                              </li></ul>
                </div>
            </div><!-- .sect-grade -->
                      
            <div class="paging">
				<ul id="paging_point"><li class=" on"><a href="#1" title="1페이지 선택">1</a></li><li class=""><a href="#2" title="">2</a></li><li class=""><a href="#3" title="">3</a></li><li class=""><a href="#4" title="">4</a></li><li class=""><a href="#5" title="">5</a></li><li class=""><a href="#6" title="">6</a></li><li class=""><a href="#7" title="">7</a></li><li class=""><a href="#8" title="">8</a></li><li class=""><a href="#9" title="">9</a></li><li class=""><a href="#10" title="">10</a></li><li class="paging-side"><button class="btn-paging next" type="button">다음 10개</button></li><li class="paging-side"><button class="btn-paging end" type="button">끝</button></li></ul>
			</div>

             
            
            <!-- 연관영화 -->
            <div class="sect-movielist" style="display :none">
                <h3><img src="http://img.cgv.co.kr/R2014/images/title/h3_relation_movie.gif" alt="RELATION MOVIE"></h3>
                <ul>
                
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=83568">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83568/83568_126.jpg" alt="아디오스 포스터">
                                    <span class="ico-grade grade-19">청소년 관람불가</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=83568"><strong>아디오스</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=83567">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83567/83567_126.jpg" alt="미션 포스터">
                                    <span class="ico-grade grade-12">12세 이상</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=83567"><strong>미션</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=83566">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83566/83566_126.jpg" alt="어서오시게스트하우스 포스터">
                                    <span class="ico-grade grade-none">미정</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=83566"><strong>어서오시게스트하우스</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=83561">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83561/83561_126.jpg" alt="소년 아메드 포스터">
                                    <span class="ico-grade grade-12">12세 이상</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=83561"><strong>소년 아메드</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=83477">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83477/83477_126.jpg" alt="세인트 주디 포스터">
                                    <span class="ico-grade grade-12">12세 이상</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=83477"><strong>세인트 주디</strong></a>
                        </div>
                    </li>
                    
                    <li>
                        <div class="box-image">
                            <a href="/movies/detail-view/?midx=83469">
                                <span class="thumb-image">
                                    <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83469/83469_126.jpg" alt="리메인 포스터">
                                    <span class="ico-grade grade-19">청소년 관람불가</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="/movies/detail-view/?midx=83469"><strong>리메인</strong></a>
                        </div>
                    </li>
                    
                </ul>
            </div><!-- .sect-movielist -->
            <!-- 연관영화 -->

        </div><!-- .col-detail -->
        <iframe class="layer-wrap review_pop" name="ifrm_movie_time_table1" id="ifrm_movie_time_table1" style="display:none" title="상세리스트" height="993px" width="849px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe><!--회원 평점 모아보기 iframe. mwpark_RR2015-->
        <form method="post" id="frmPointPopup" action="/movies/point/default-irm.aspx" novalidate="novalidate">
            <input type="hidden" name="userid" id="frmPointUserId">
            <input type="hidden" name="nick" id="frmPointNick">
        </form>

        
<div class="col-aside">
    <div class="ad-partner01">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
    </div>
    <div class="ad-external01">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="기업광고-CGV" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
    </div>
    <div class="sect-moviesearch">
        <div class="searchrank">
            <h3>인기 영화 검색어</h3>
            <ol>
                
                        <li>
                            <a href="/search/?query=%eb%b0%98%eb%8f%84">1. <strong>반도</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%eb%b6%80%ed%99%9c">2. <strong>부활</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ec%bd%94%eb%82%9c">3. <strong>코난</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ea%b0%95%ec%b2%a0%eb%b9%842+%ec%a0%95%ec%83%81%ed%9a%8c%eb%8b%b4">4. <strong>강철비2 정상회담</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ec%a7%b1%ea%b5%ac%eb%8a%94%eb%aa%bb%eb%a7%90%eb%a0%a4">5. <strong>짱구는못말려</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%eb%af%b8%ec%85%98">6. <strong>미션</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ec%8b%9c%eb%84%a4%eb%a7%88%ec%b2%9c%ea%b5%ad">7. <strong>시네마천국</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ec%96%b4%eb%b2%a4%ec%a0%b8%ec%8a%a4">8. <strong>어벤져스</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ec%b1%84%ec%9a%a9">9. <strong>채용</strong></a>
                        </li>
                    
                        <li>
                            <a href="/search/?query=%ec%86%8c%eb%a6%ac%ea%be%bc">10. <strong>소리꾼</strong></a>
                        </li>
                    
            </ol>
        </div>
    </div>
</div>

<!--<div class="sect-sns">
    <ul>                	
        <li><a class="link-facebook" href="#" id="link_facebook">FaceBook</a></li>
        <li><a class="link-twitter" href="#" id="link_twitter">Twitter</a></li>
    </ul>
    <div class="share">
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=341385562539159&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            } (document, 'script', 'facebook-jssdk'));
        </script>

        <div class="fb-like" style="z-index:2" data-href="http%3a%2f%2fwww.cgv.co.kr%2fmovies%2fdetail-view%2fdefault.aspx%3fmidx%3d83160" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
    </div>-->


       

</div>

    </div>
    <span style="display:none" class="modifyCommentDummy"></span>
</div>

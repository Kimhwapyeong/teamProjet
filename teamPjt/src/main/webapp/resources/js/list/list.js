// 날짜 포맷 정규식 (yyyy-mm-dd)
const regexDate2 = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
// date 객체 만들기
const thisDate2 = new Date();
// 오늘 날짜 (yyyy-mm-dd 00:00:00)
const today2 = new Date();
// 달력 이동 최대 개월 수
const limitMonth2 = 4;
// 달력에서 표기하는 날짜 객체
let thisMonth2 = today2;
// 달력에서 표기하는 년
let currentYear2 = thisMonth2.getFullYear();
// 달력에서 표기하는 월
let currentMonth2 = thisMonth2.getMonth();
// 체크인 날짜
let checkInDate2 = "";
// 체크아웃 날짜
let checkOutDate2 = "";

$(document).ready(function () {
    // 달력 만들기
    calendarInit(thisMonth2);

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        const startDate = $('.start-year-month').html().split('.');

        // 달력이 현재 년 월 보다 같거나 작을경우 뒤로가기 막기
        if (getlimitMonth2Check(parseInt(startDate[0]), parseInt(startDate[1])) <= 0) {
            return;
        }

        thisMonth2 = new Date(currentYear2, currentMonth2 - 1, 1);
        calendarInit(thisMonth2);
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        const lastDate = $('.last-year-month').html().split('.');

        // 예약 가능 최대 개월수와 같거나 크다면 다음달 이동 막기
        if (getlimitMonth2Check(parseInt(lastDate[0]), parseInt(lastDate[1])) >= limitMonth2) {
            alert('최대예약 기간은 ' + limitMonth2 + '개월 입니다.');
            return;
        }

        let limitYear = today2.getFullYear();
        if (currentMonth2 + limitMonth2 >= 12) {
            limitYear = limitYear + 1
        }

        thisMonth2 = new Date(currentYear2, currentMonth2 + 1, 1);
        calendarInit(thisMonth2);
    });
});

// 달력 그리기
function calendarInit(thisMonth2) {

    // 렌더링을 위한 데이터 정리
    currentYear2 = thisMonth2.getFullYear();
    currentMonth2 = thisMonth2.getMonth();

    // 렌더링 html 요소 생성
    let start_calendar = '';
    let last_calendar = '';

    makeStartCalendar();
    makeLastCalendar();

    // start_calendar
    function makeStartCalendar() {
        // 이전 달의 마지막 날 날짜와 요일 구하기
        const startDay = new Date(currentYear2, currentMonth2, 0);
        const prevDate = startDay.getDate();
        const prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        const endDay = new Date(currentYear2, currentMonth2 + 1, 0);
        const nextDate = endDay.getDate();
        const nextDay = endDay.getDay();

        // 지난달
        for (let i = prevDate - prevDay; i <= prevDate; i++) {
            start_calendar += pervDisableDay(i);
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            // 이번달이 현재 년도와 월이 같을경우
            if (currentYear2 === today2.getFullYear() && currentMonth2 === today2.getMonth()) {
                // 지난 날짜는 disable 처리
                if (i < today2.getDate()) {
                    start_calendar += pervDisableDay(i)
                } else {
                    start_calendar += dailyDay(currentYear2, currentMonth2, i);
                }
            } else {
                start_calendar += dailyDay(currentYear2, currentMonth2, i);
            }
        }

        // 다음달 7 일 표시
        for (let i = 1; i <= (6 - nextDay); i++) {
            start_calendar += nextDisableDay(i);
        }

        $('.start-calendar').html(start_calendar);
        // 월 표기
        $('.start-year-month').text(currentYear2 + '.' + zf((currentMonth2 + 1)));
    }

    // last_calendar
    function makeLastCalendar() {
        let tempcurrentYear2 = currentYear2;
        let tempcurrentMonth2 = currentMonth2 + 1;

        if (tempcurrentMonth2 >= 12) {
            tempcurrentYear2 = parseInt(tempcurrentYear2) + 1;
            tempcurrentMonth2 = 0;
        }

        // 이전 달의 마지막 날 날짜와 요일 구하기
        const startDay = new Date(tempcurrentYear2, tempcurrentMonth2, 0);
        const prevDate = startDay.getDate();
        const prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        const endDay = new Date(tempcurrentYear2, tempcurrentMonth2 + 1, 0);
        const nextDate = endDay.getDate();
        const nextDay = endDay.getDay();

        // 지난달
        for (let i = prevDate - prevDay; i <= prevDate; i++) {
            last_calendar += pervDisableDay(i);
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            // 이번달이 현재 년도와 월이 같을경우
            if (tempcurrentYear2 === today2.getFullYear() && tempcurrentMonth2 === today2.getMonth()) {
                // 지난 날짜는 disable 처리
                if (i < today2.getDate()) {
                    last_calendar += pervDisableDay(i)
                } else {
                    last_calendar += dailyDay(tempcurrentYear2, tempcurrentMonth2, i);
                }
            } else {
                last_calendar += dailyDay(tempcurrentYear2, tempcurrentMonth2, i);
            }

        }

        // 다음달 7 일 표시
        for (let i = 1; i <= (6 - nextDay); i++) {
            last_calendar += nextDisableDay(i);
        }

        $('.last-calendar').html(last_calendar);
        // 월 표기
        $('.last-year-month').text(tempcurrentYear2 + '.' + zf((tempcurrentMonth2 + 1)));
    }


    // 지난달 미리 보기
    function pervDisableDay(day) {
        return '<div class="day prev disable">' + day + '</div>';
    }

    // 이번달
    function dailyDay(currentYear2, currentMonth2, day) {
        const date = currentYear2 + '' + zf((currentMonth2 + 1)) + '' + zf(day);

        if (checkInDate2 === date) {
            return '<div class="day current checkIn" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        } else if (checkOutDate2 === date) {
            return '<div class="day current checkOut" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        } else {
            return '<div class="day current" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        }
    }

    // 다음달 미리 보기
    function nextDisableDay(day) {
        return '<div class="day next disable">' + day + '</div>';
    }

    addClassSelectDay();
}

// 체크인 체크아웃 기간 안에 날짜 선택 처리
function addClassSelectDay() {
    if (checkInDate2 !== "" && checkOutDate2 != "") {
        $('.day').each(function () {
            const data_day = $(this).data('day');

            if (data_day !== undefined && data_day >= checkInDate2 && data_day <= checkOutDate2) {
                $(this).addClass('selectDay');
            }
        });

        // $('.checkIn').find('.check_in_out_p').html('체크인');
        // $('.checkOut').find('.check_in_out_p').html('체크아웃');
    }	
    
    	/// 총 예약일 수 구하기
    	if(checkOutDate2!='' && checkInDate2!=''){
    		
    		// 정규 표현식으로 20230823 이렇게 되어있는걸 2023-08-23 으로 바꿈
    		let a = checkInDate2.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
    		let b = checkOutDate2.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
    		
    		// 날짜 형식으로 변환
    		let ci = new Date(a);
    		let co = new Date(b);
    		
    		let diff = Math.abs(co.getTime() - ci.getTime());
    		diff = Math.ceil(diff / (1000*60*60*24));
    		
	        $('.check_day_count').html(diff+'일');
	        $('#reserved_day').val(diff);
	        $('#reserved_checkIn').val(a);
	        $('#reserved_checkOut').val(b);
	        
	        $('.space').html('~');
        }
}

// 달력 날짜 클릭
function selectDay(obj) {
	console.log(obj);
    if (checkInDate2 === "") {
        $(obj).addClass('checkIn');
        // $('.checkIn').find('.check_in_out_p').html('체크인');

        checkInDate2 = $(obj).data('day');

        $('#check_in_day_list').html(getcheckInDate2Html());

        lastcheckInDate2();
    } else {
        // 체크인 날짜를 한번더 클릭했을때 아무 동작 하지 않기
        if (parseInt(checkInDate2) === $(obj).data('day')) {
            return;
        }

        // 체크인 날짜보다 체크아웃 날짜를 더 앞으로 찍었을경우 체크인 날짜와 체크아웃 날짜를 바꿔준다
        if (checkOutDate2 === "" && parseInt(checkInDate2) > $(obj).data('day')) {
            $('.checkIn').find('.check_in_out_p').html('');
            $('.day').removeClass('checkIn');
            $('#check_in_day_list').html("");

            checkOutDate2 = checkInDate2
            checkInDate2 = $(obj).data('day');

            $(obj).addClass('checkIn');
            // $('.checkIn').find('.check_in_out_p').html('체크인');

            $('.day[data-day="' + checkOutDate2 + '"]').addClass('checkOut');
            $('.checkOut').find('.check_in_out_p').html('체크아웃');

            $('#check_in_day_list').html(getcheckInDate2Html());
            $('#check_out_day_list').html(getcheckOutDate2Html());

            addClassSelectDay();

            return;
        }

        // 체크아웃
        if (checkOutDate2 === "") {
            $(obj).addClass('checkOut');
            // $('.checkOut').find('.check_in_out_p').html('체크아웃');

            checkOutDate2 = $(obj).data('day');

            $('#check_out_day_list').html(getcheckOutDate2Html());

            addClassSelectDay();
        } else {
            // 체크아웃을 날짜 까지 지정했지만 체크인 날짜를 변경할 경우
            if (confirm('체크인 날짜를 변경 하시겠습니까?')) {
                $('.checkIn').find('.check_in_out_p').html('');
                $('.checkOut').find('.check_in_out_p').html('');

                $('.day').removeClass('checkIn');
                $('.day').removeClass('checkOut');
                $('.day').removeClass('selectDay');

                $(obj).addClass('checkIn');
                //$('.checkIn').find('.check_in_out_p').html('체크인');

                checkInDate2 = $(obj).data('day');
                checkOutDate2 = "";

                $('#check_in_day_list').html(getcheckInDate2Html());
                $('#check_out_day_list').html("");

                lastcheckInDate2();
            }
        }
    }
}

// 체크인 날짜 표기
function getcheckInDate2Html() {
    checkInDate2 = checkInDate2.toString();
    return checkInDate2.substring('0', '4') + "-" + checkInDate2.substring('4', '6') + "-" + checkInDate2.substring('6', '8') + " ( " + strWeekDay(weekday(checkInDate2)) + " )";
}

// 체크아웃 날짜 표기
function getcheckOutDate2Html() {
    checkOutDate2 = checkOutDate2.toString();
    return checkOutDate2.substring('0', '4') + "-" + checkOutDate2.substring('4', '6') + "-" + checkOutDate2.substring('6', '8') + " ( " + strWeekDay(weekday(checkOutDate2)) + " )";
}

// 체크인 날짜 클릭시 예약 가능한 마지막 날인지 체크 마지막날 일경우 체크아웃 날짜 자동 선택
function lastcheckInDate2() {
    // 날짜 비교를 위해 시간값을 초기화 하기위해 체크인 날짜 다시 셋팅
    let thisCheckDate = new Date(conversion_date(checkInDate2, 1));
    thisCheckDate = new Date(thisCheckDate.getFullYear(), thisCheckDate.getMonth(), thisCheckDate.getDate());

    // 예약 가능한 마지막달의 마지막 날짜 셋팅
    let thisLastDate = new Date(today2.getFullYear(), ((today2.getMonth() + 1) + limitMonth2), 0);

    // 체크인 날짜 클릭시 해당일이 예약 가능한 달에 마지막 날짜 일때 체크아웃 강제 표기
    if (thisCheckDate.getTime() === thisLastDate.getTime()) {
        // 체크인 날짜에 하루 더하기
        let thischeckOutDate2 = new Date(thisCheckDate.getFullYear(), thisCheckDate.getMonth(), thisCheckDate.getDate());
        thischeckOutDate2.setDate(thischeckOutDate2.getDate() + 1);
        // YYYYMMDD 형태로 변환
        thischeckOutDate2 = thischeckOutDate2.getFullYear() + "" + zf((thischeckOutDate2.getMonth() + 1)) + "" + zf(thischeckOutDate2.getDate());

        checkOutDate2 = thischeckOutDate2;

        $($(".day div[data-day='" + checkOutDate2 + "']")).addClass('checkOut');

        if ($('.checkOut').find('p').hasClass('holi_day_p')) {
            $('.checkOut').find('.holi_day_p').hide();
        }

        $('.checkOut').find('.check_in_out_p').html('체크아웃');

        $('#check_out_day_list').html(getcheckOutDate2Html());

        addClassSelectDay();
    }
}

// 최대 개월수 체크
function getlimitMonth2Check(year, month) {
    let months = ((today2.getFullYear() - year) * 12);
    months -= (today2.getMonth() + 1);
    months += month;

    return months;
}

// 날짜형태 변환
function conversion_date(YYMMDD, choice) {
    const yyyy = YYMMDD.substring(0, 4);
    const mm = YYMMDD.substring(4, 6);
    const dd = YYMMDD.substring(6, 8);

    return (choice === 1)
        ? yyyy + "-" + zf(mm) + "-" + zf(dd)
        : yyyy + "." + zf(mm) + "." + zf(dd);
}

// 몇요일인지 알려주는 함수 (숫자 형태)
function weekday(YYYYMMDD) {
    const weekday_year = YYYYMMDD.substring(0, 4);
    const weekday_menth = YYYYMMDD.substring(4, 6);
    const weekday_day = YYYYMMDD.substring(6, 9);

    return new Date(weekday_year + "-" + weekday_menth + "-" + weekday_day).getDay();
}

// 요일 리턴
function strWeekDay(weekday) {
    switch (weekday) {
        case 0: return "일"
            break;
        case 1: return "월"
            break;
        case 2: return "화"
            break;
        case 3: return "수"
            break;
        case 4: return "목"
            break;
        case 5: return "금"
            break;
        case 6: return "토"
            break;
    }
}

// 숫자 두자리로 만들기
function zf(num) {
    num = Number(num).toString();

    if (Number(num) < 10 && num.length == 1) {
        num = "0" + num;
    }

    return num;
}
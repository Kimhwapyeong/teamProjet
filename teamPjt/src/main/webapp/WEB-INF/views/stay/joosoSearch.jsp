<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.CodeMirror {
    font-family: monospace;
    font-size: 14px;
    height: 300px
}

.CodeMirror-scroll {
    overflow: auto
}

.CodeMirror-lines {
    padding: 4px 0
}

.CodeMirror pre {
    padding: 0 4px
}

.CodeMirror-gutter-filler,.CodeMirror-scrollbar-filler {
    background-color: #fff
}

.CodeMirror-gutters {
    border-right: 1px solid #ddd;
    background-color: #f7f7f7;
    white-space: nowrap
}

.CodeMirror-linenumber {
    padding: 0 3px 0 5px;
    min-width: 20px;
    text-align: right;
    color: #999;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

.CodeMirror-guttermarker {
    color: #000
}

.CodeMirror-guttermarker-subtle {
    color: #999
}

.CodeMirror div.CodeMirror-cursor {
    border-left: 1px solid #000
}

.CodeMirror div.CodeMirror-secondarycursor {
    border-left: 1px solid silver
}

.CodeMirror.cm-keymap-fat-cursor div.CodeMirror-cursor {
    width: auto;
    border: 0;
    background: #7e7
}

.cm-animate-fat-cursor {
    width: auto;
    border: 0;
    -webkit-animation: blink 1.06s steps(1) infinite;
    -moz-animation: blink 1.06s steps(1) infinite;
    animation: blink 1.06s steps(1) infinite
}

@-moz-keyframes blink {
    0% {
        background: #7e7
    }

    50% {
        background: 0 0
    }

    100% {
        background: #7e7
    }
}

@-webkit-keyframes blink {
    0% {
        background: #7e7
    }

    50% {
        background: 0 0
    }

    100% {
        background: #7e7
    }
}

@keyframes blink {
    0% {
        background: #7e7
    }

    50% {
        background: 0 0
    }

    100% {
        background: #7e7
    }
}

.cm-tab {
    display: inline-block
}

.CodeMirror-ruler {
    border-left: 1px solid #ccc;
    position: absolute
}

.cm-s-default .cm-keyword {
    color: #333;
    font-weight: 700
}

.cm-s-default .cm-atom {
    color: #219
}

.cm-s-default .cm-number {
    color: #099
}

.cm-s-default .cm-def {
    color: #00f
}

.cm-s-default .cm-variable-2 {
    color: #05a
}

.cm-s-default .cm-variable-3 {
    color: #085
}

.cm-s-default .cm-comment {
    color: #998;
    font-style: italic
}

.cm-s-default .cm-string {
    color: #d14
}

.cm-s-default .cm-string-2 {
    color: #f50
}

.cm-s-default .cm-meta,.cm-s-default .cm-qualifier {
    color: #555
}

.cm-s-default .cm-builtin {
    color: #30a
}

.cm-s-default .cm-bracket {
    color: #997
}

.cm-s-default .cm-tag {
    color: navy
}

.cm-s-default .cm-attribute {
    color: teal
}

.cm-s-default .cm-header {
    color: #00f
}

.cm-s-default .cm-quote {
    color: #090
}

.cm-s-default .cm-hr {
    color: #999
}

.cm-s-default .cm-link {
    color: #00c
}

.cm-negative {
    color: #d44
}

.cm-positive {
    color: #292
}

.cm-header,.cm-strong {
    font-weight: 700
}

.cm-em {
    font-style: italic
}

.cm-link {
    text-decoration: underline
}

.cm-invalidchar,.cm-s-default .cm-error {
    color: red
}

div.CodeMirror span.CodeMirror-matchingbracket {
    color: #0f0
}

div.CodeMirror span.CodeMirror-nonmatchingbracket {
    color: #f22
}

.CodeMirror-matchingtag {
    background: rgba(255,150,0,.3)
}

.CodeMirror-activeline-background {
    background: #e8f2ff
}

.CodeMirror {
    line-height: 1.6;
    position: relative;
    overflow: hidden;
    background: #fff;
    color: #000
}

.CodeMirror-scroll {
    margin-bottom: -30px;
    margin-right: -30px;
    padding-bottom: 30px;
    height: 100%;
    outline: 0;
    position: relative;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

.CodeMirror-sizer {
    position: relative;
    border-right: 30px solid transparent;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

.CodeMirror-gutter-filler,.CodeMirror-hscrollbar,.CodeMirror-scrollbar-filler,.CodeMirror-vscrollbar {
    position: absolute;
    z-index: 6;
    display: none
}

.CodeMirror-vscrollbar {
    right: 0;
    top: 0;
    overflow-x: hidden;
    overflow-y: scroll
}

.CodeMirror-hscrollbar {
    bottom: 0;
    left: 0;
    overflow-y: hidden;
    overflow-x: scroll
}

.CodeMirror-scrollbar-filler {
    right: 0;
    bottom: 0
}

.CodeMirror-gutter-filler {
    left: 0;
    bottom: 0
}

.CodeMirror-gutters {
    position: absolute;
    left: 0;
    top: 0;
    padding-bottom: 30px;
    z-index: 3
}

.CodeMirror-gutter {
    white-space: normal;
    height: 100%;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    padding-bottom: 30px;
    margin-bottom: -32px;
    display: inline-block
}

.CodeMirror-gutter-elt {
    position: absolute;
    cursor: default;
    z-index: 4
}

.CodeMirror-lines {
    cursor: text
}

.CodeMirror pre {
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    border-radius: 0;
    border-width: 0;
    background: 0 0;
    font-family: inherit;
    font-size: inherit;
    margin: 0;
    white-space: pre;
    word-wrap: normal;
    line-height: inherit;
    color: inherit;
    z-index: 2;
    position: relative;
    overflow: visible
}

.CodeMirror-wrap pre {
    word-wrap: break-word;
    white-space: pre-wrap;
    word-break: normal
}

.CodeMirror-linebackground {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: 0
}

.CodeMirror-linewidget {
    position: relative;
    z-index: 2;
    overflow: auto
}

.CodeMirror-wrap .CodeMirror-scroll {
    overflow-x: hidden
}

.CodeMirror-measure {
    position: absolute;
    width: 100%;
    height: 0;
    overflow: hidden;
    visibility: hidden
}

.CodeMirror-measure pre {
    position: static
}

.CodeMirror div.CodeMirror-cursor {
    position: absolute;
    border-right: none;
    width: 0
}

div.CodeMirror-cursors {
    visibility: hidden;
    position: relative;
    z-index: 1
}

.CodeMirror-focused div.CodeMirror-cursors {
    visibility: visible
}

.CodeMirror-selected {
    background: #d9d9d9
}

.CodeMirror-focused .CodeMirror-selected {
    background: #d7d4f0
}

.CodeMirror-crosshair {
    cursor: crosshair
}

.cm-searching {
    background: #ffa;
    background: rgba(255,255,0,.4)
}

.cm-force-border {
    padding-right: .1px
}

@media print {
    .CodeMirror div.CodeMirror-cursors {
        visibility: hidden
    }
}

.CodeMirror {
    height: 100%;
    font-size: 13px
}

.guide_v1 .CodeMirror {
    background-color: #f1f1f1
}

.CodeMirror-gutters {
    background-color: #fff
}

.CodeMirror pre {
    padding: 0 10px
}

.cm-s-default .cm-string {
    color: #080
}

.cm-s-default .cm-attribute {
    color: #606
}

.colorPicker {
    display: none;
    position: absolute;
    overflow: hidden;
    border: 1px solid #aaa;
    cursor: default;
    background-color: #555;
    width: 171px;
    height: 238px;
    left: 0;
    z-index: 999
}

.colorPicker .colorbar {
    position: relative;
    background: url(//t1.daumcdn.net/postcode/resource/images/colorband.png) 0 0/171px 18px no-repeat;
    height: 18px;
    width: 171px;
    -webkit-background-size: 171px 18px;
    margin-bottom: 1px
}

.colorPicker .colorbar .bar {
    position: absolute;
    top: 0;
    background-color: #4cfdf7;
    height: 100%;
    width: 1px;
    box-shadow: 0 1px 1px #494949
}

.colorPicker .colorplain {
    position: relative;
    height: 171px;
    width: 171px;
    margin: 0 auto
}

.colorPicker .picker {
    position: absolute;
    top: -2px;
    right: -2px;
    border: 2px solid #888;
    width: 5px;
    height: 5px;
    border-radius: 50%
}

.colorPicker .color_pre {
    width: 100%;
    height: 18px;
    text-align: center;
    margin-top: 1px;
    font-size: 12px
}

.colorPicker .btn_wrap {
    width: 100%
}

.colorPicker .btn {
    float: left;
    height: 29px;
    font-size: 12px;
    color: #fff;
    font-weight: 400;
    cursor: pointer;
    border: 0
}

.colorPicker .btn:hover {
    background: #999
}

.colorPicker .ok {
    width: 86px;
    border-right: 1px solid #47515d;
    background-color: #000
}

.colorPicker .cancel {
    width: 85px;
    background-color: #444
}

.colorPicker .btn span::selection,.colorPicker .btn::selection,.colorPicker .colorbar::selection,.colorPicker .colorplain img::selection,.colorPicker::selection {
    background: 0 0
}

body {
    margin: 0;
    font: 13px/1.6 NanumGothic,'Malgun Gothic',dotum,'ë‹ì›€',sans-serif
}

a {
    color: #333;
    text-decoration: none
}

a.link {
    border-bottom: 1px dashed #999;
    padding-bottom: 2px
}

a.inlink {
    text-decoration: underline
}

a.anchor {
    padding-top: 80px
}

ol,ul {
    padding-left: 20px
}

h2 {
    margin-top: 0
}

h3 {
    margin: 50px 0 0;
    font-size: 1.3em
}

pre {
    word-break: break-all;
    word-wrap: break-word;
    border: 1px solid #ddd;
    padding: 10px;
    border-radius: 3px;
    background-color: #fff;
    margin-bottom: 20px;
    tab-size: 2
}

.hide {
    display: none
}

.screen_out {
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px
}

.wrap {
    width: 860px;
    margin: 0 auto;
    position: relative
}

.devide {
    float: left;
    width: 50%
}

.section {
    padding: 60px 0;
    border-top: 1px solid #ddd;
    clear: both
}

.section.bg {
    background-color: #fafafa
}

.sub_section {
    margin: 20px 0 0
}

.wrap li {
    padding: 4px 0
}

.arrow:after {
    content: ' â†’';
    font-size: 40px;
    vertical-align: top;
    line-height: 18px
}

.emph {
    color: #fa4257;
    font-style: normal
}

.emph2 {
    color: #3082D9;
    font-style: normal
}

.emph3 {
    font-weight: 700;
    font-style: normal
}

.more {
    color: #3b94d9;
    display: inline-block
}

.hidden {
    display: none
}

.d_form {
    margin: .2em 0;
    font-size: 1em;
    padding: .5em;
    border: 1px solid #ccc;
    border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
    box-shadow: inset .1em .1em .15em rgba(0,0,0,.1);
    vertical-align: middle;
    line-height: 1.25em;
    outline: 0;
    width: 20em
}

.d_form.std {
    width: 25em
}

.d_form.mini {
    width: 7em
}

.d_form.large {
    width: 38em
}

.d_btn {
    display: inline-block;
    padding: .5em 1em;
    margin: .4em .15em;
    border: 1px solid #ccc;
    border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
    cursor: pointer;
    color: #464646;
    border-radius: .2em;
    vertical-align: middle;
    font-size: 1em;
    line-height: 1.25em;
    background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));
    background-image: -moz-linear-gradient(top,#fff,#f2f2f2);
    background-image: -o-gradient(top,#fff,#f2f2f2);
    background-image: linear-gradient(top,#fff,#f2f2f2)
}

.d_btn:hover {
    color: #464646;
    text-decoration: none;
    background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),to(#e5e5e5));
    background-image: -moz-linear-gradient(top,#fff,#e5e5e5);
    background-image: -o-linear-gradient(top,#fff,#e5e5e5);
    background-image: linear-gradient(top,#fff,#e5e5e5)
}

.d_btn:active {
    border-color: #999;
    background-image: -webkit-gradient(linear,left top,left bottom,from(#ebebeb),to(#dbdbdb));
    background-image: -moz-linear-gradient(top,#ebebeb,#dbdbdb);
    background-image: -o-linear-gradient(top,#ebebeb,#dbdbdb);
    background-image: linear-gradient(top,#ebebeb,#dbdbdb);
    background-image: inset 0 1px .24em rgba(0,0,0,.4)
}

.data_key {
    font-weight: 700
}

#daumLogo {
    position: absolute;
    top: 12px
}

#daumLogo img {
    border: 0
}

#menu {
    position: fixed;
    right: 0;
    top: 0;
    z-index: 10;
    background-color: #333;
    width: 100%;
    box-shadow: 0 1px 1px red;
    line-height: 20px
}

#menu .wrap {
    padding: 6px 0;
    height: 27px
}

#menu ul {
    padding-left: 0;
    margin: 0;
    float: right
}

#menu li {
    float: left;
    margin-left: 35px;
    list-style: none
}

#menu li a:hover {
    text-decoration: underline
}

#menu a {
    color: #fff
}

/* #header {
    padding: 45px 0 15px;
    background-color: #fa4257;
    position: relative;
    color: #fff;
    background-image: -webkit-linear-gradient(bottom right,rgba(255,50,120,1) 20%,rgba(200,0,0,.2) 80%),-webkit-linear-gradient(top left,rgba(255,255,0,.5) 0,rgba(255,50,100,.5) 100%);
    background-image: -ms-linear-gradient(bottom right,rgba(255,50,120,1) 20%,rgba(200,0,0,.2) 80%),-ms-linear-gradient(top left,rgba(255,255,0,.5) 0,rgba(255,50,100,.5) 100%);
    background-image: -moz-linear-gradient(bottom right,rgba(255,50,120,1) 20%,rgba(200,0,0,.2) 80%),-moz-linear-gradient(top left,rgba(255,255,0,.5) 0,rgba(255,50,100,.5) 100%);
    background-image: linear-gradient(to bottom right,rgba(255,50,120,1) 20%,rgba(200,0,0,.2) 80%),linear-gradient(to top left,rgba(255,255,0,.5) 0,rgba(255,50,100,.5) 100%);
    background-size: 400% 400%;
    background-position: 50% 50%;
    -webkit-animation: gradient 10s ease;
    -moz-animation: gradient 10s ease;
    animation: gradient 10s ease
} */

@-webkit-keyframes gradient {
    0% {
        background-position: 50% 50%
    }

    50% {
        background-position: 50% 100%
    }

    100% {
        background-position: 50% 50%
    }
}

@-moz-keyframes gradient {
    0% {
        background-position: 50% 50%
    }

    50% {
        background-position: 50% 100%
    }

    100% {
        background-position: 50% 50%
    }
}

@keyframes gradient {
    0% {
        background-position: 50% 50%
    }

    50% {
        background-position: 50% 100%
    }

    100% {
        background-position: 50% 50%
    }
}

#header .wrap {
    height: 100%;
    padding: 0
}

#header .tip {
    color: #fff;
    position: absolute;
    right: 0;
    bottom: 10px
}

#header .tip a {
    color: #fff;
    text-decoration: none
}

#header a.cls_qna,a.cls_qna {
    text-decoration: underline
}

#intro {
    float: none
}

#feature {
    padding-bottom: 30px
}

#feature .arrow {
    margin: 10px 0 0 20px;
    position: relative;
    text-shadow: 0 1px 1px #ddd
}

#feature ul {
    margin-top: 20px
}

#preview {
    float: right;
    border: 1px solid #aaa;
    margin: -160px 0 60px;
    width: 400px;
    height: 660px;
    background-color: #ececec;
    -webkit-overflow-scrolling: touch
}

table {
    border-collapse: collapse;
    margin: 20px 0;
    width: 100%
}

table td,table th {
    border-bottom: 1px solid #ddd;
    word-break: break-all
}

table th {
    padding: 10px;
    border: 1px solid #999;
    border-width: 1px 0
}

table td {
    padding: 7px 15px
}

.info code,table code,table td.keep {
    font-weight: 700
}

table .tip {
    font-size: .9em;
    color: #999
}

table .tip.emph {
    font-size: .9em;
    color: #fa4257
}

table .tip a {
    text-decoration: underline
}

table.docs td:first-child {
    width: 180px
}

table.compare td:first-child {
    width: 130px
}

table.docs td:nth-child(2) {
    max-width: 230px
}

table.compare td:nth-child(2),table.compare td:nth-child(3) {
    width: 25%
}

td.new {
    color: #156ce7
}

td.deprecated {
    color: #999
}

td.change {
    color: #e90
}

/* .info {
    border: 1px solid #ddd;
    background-color: #ECF2F7;
    padding: 10px 20px;
    border-radius: 3px;
    margin-top: 10px
} */

.warning {
    border: 1px solid #ddd;
    background-color: #fee;
    padding: 10px 20px;
    border-radius: 3px;
    margin-top: 10px
}

.w_icon {
    background-color: #fa4257;
    border-radius: 10px;
    width: 20px;
    height: 20px;
    text-align: center;
    color: #fff;
    display: inline-block;
    opacity: .8
}

.qna li p {
    margin: 10px 0 15px
}

.example {
    float: left;
    width: 100%;
    margin: 10px 0 20px
}

.example .data,.example .real {
    margin: 5px 10px
}

.example ul {
    padding: 0;
    margin: 0
}

.l_no {
    list-style: decimal
}

.real {
    background-color: #fff
}

.real a {
    cursor: default
}

.real li {
    margin: 0;
    list-style: none;
    position: relative;
    padding: 10px 15px 15px
}

.real .post_search {
    font-size: 16px;
    height: 32px;
    padding: 7px 45px 0 15px;
    border-bottom: 1px solid #363636
}

.real .txt_postcode {
    color: #fa4257;
    font-size: 14px
}

.real .txt_postcode_s {
    color: #fa4257;
    font-size: 13px
}

.real .link_base {
    margin-left: 2px;
    font-size: 14px;
    color: #888
}

.real .link_base_s {
    margin-left: 2px;
    font-size: 13px;
    color: #888
}

.real .list_address {
    overflow: hidden;
    width: 100%;
    padding-top: 2px;
    margin: 0
}

.real .list_address .tit_address {
    display: inline-block;
    float: left;
    width: 34px;
    height: 13px;
    margin-top: 7px;
    padding: 0 1px;
    border: 1px solid #d4e2ef;
    border-radius: 1px;
    font-size: 11px;
    line-height: 14px;
    color: #008bd3;
    text-align: center
}

.real .list_address .txt_guide {
    color: #008bd3
}

.real .info_open .info_address.related_address .txt_address.fst,.real .list_address .txt_address {
    display: block;
    border-top: 1px solid #e1e1e1
}

.real .list_address .info_address .dontknow,.real .list_address .info_address .fst {
    border-top: none
}

.real .info_open .info_address.related_address .txt_address {
    padding: 3px 0 4px
}

.real .list_address .txt_address a.selected {
    background-color: #FAF810
}

.real .list_address .txt_detail {
    color: #497298
}

.real .list_address .info_address {
    overflow: hidden;
    margin-top: 4px;
    padding-left: 7px;
    line-height: 20px
}

.real .btn_wrap {
    margin-top: 4px
}

.real .txt_fold {
    display: inline-block;
    margin: 0;
    padding: 0 6px;
    border-radius: 10px;
    font-size: 11px;
    line-height: 15px;
    color: #fff;
    background-color: #959595;
    vertical-align: bottom
}

.real .txt_extra {
    display: inline-block;
    font-family: dotum,'ë‹ì›€',sans-serif;
    font-size: 12px;
    color: #666;
    line-height: 21px;
    vertical-align: bottom;
    height: 18px;
    margin: 0
}

.real .ico_l {
    display: inline-block;
    vertical-align: bottom;
    line-height: 18px;
    width: 7px;
    height: 18px;
    background: url(//t1.daumcdn.net/postcode/resource/images/related_ico.png) 0 4px no-repeat
}

.data ul {
    margin: 10px 10px 20px 20px
}

.data li {
    padding: 2px 0
}

.pln {
    color: #000
}

@media screen {
    .str {
        color: #080
    }

    .kwd {
        color: #008
    }

    .com {
        color: #a99
    }

    .typ {
        color: #606
    }

    .lit {
        color: #066
    }

    .clo,.opn,.pun {
        color: #660
    }

    .tag {
        color: #008
    }

    .atn {
        color: #606
    }

    .atv {
        color: #080
    }

    .dec,.var {
        color: #606
    }

    .fun {
        color: red
    }
}

@media print,projection {
    .str {
        color: #060
    }

    .kwd {
        color: #006;
        font-weight: 700
    }

    .com {
        color: #a99;
        font-style: italic
    }

    .typ {
        color: #404;
        font-weight: 700
    }

    .lit {
        color: #044
    }

    .clo,.opn,.pun {
        color: #440
    }

    .tag {
        color: #006;
        font-weight: 700
    }

    .atn {
        color: #404
    }

    .atv {
        color: #060
    }
}

ol.linenums {
    margin-top: 0;
    margin-bottom: 0
}

li.L0,li.L1,li.L2,li.L3,li.L5,li.L6,li.L7,li.L8 {
    list-style-type: none
}

li.L1,li.L3,li.L5,li.L7,li.L9 {
    background: #eee
}

.theme_wrap {
    overflow: hidden
}

.alert_text {
    display: none;
    font-size: 16px;
    font-weight: 700
}

.control {
    padding-top: 15px
}

.colorset {
    width: 400px
}

.preset {
    float: left;
    display: block;
    overflow: hidden;
    position: relative;
    width: 156px;
    height: 30px;
    margin: 0 16px 0 0;
    line-height: 30px;
    border: 1px solid #bbb;
    border-radius: 3px;
    padding-left: 10px;
    -webkit-box-shadow: inset 0 -1px #eee;
    box-shadow: inset 0 -1px #eee
}

.preset .tit {
    margin-left: 2px
}

.opt_select {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 30px;
    border: 0;
    opacity: .01;
    filter: alpha(opacity=0);
    cursor: pointer;
    z-index: 2
}

.preset .img_preset {
    position: absolute;
    top: 12px;
    right: 10px;
    width: 11px;
    height: 7px;
    background: url(//t1.daumcdn.net/postcode/resource/images/ico_traffic_320.png) no-repeat;
    cursor: pointer;
    z-index: 1
}

.manual_apply {
    font-size: 13px;
    float: left;
    width: 140px;
    height: 25px;
    margin-top: 5px
}

.manual_apply input {
    width: 20px;
    height: 20px;
    vertical-align: middle
}

.manual_apply em {
    vertical-align: top;
    font-style: normal;
    letter-spacing: -1px;
    padding-left: 2px
}

.btn_apply {
    color: #fff;
    background-color: #d9534f;
    width: 65px;
    height: 31px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 26px;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid transparent;
    border-radius: 4px
}

.btn_apply.ing {
    background-color: #ddd;
    border-color: #ddd;
    color: #333;
    font-size: 13px
}

.list_color {
    position: relative;
    clear: both
}

.list_color ul,.list_color ul li {
    list-style: none;
    padding: 0;
    margin: 0
}

.list_color ul li {
    padding-top: 19px
}

.list_color .color {
    border: 1px solid #ddd;
    width: 136px;
    height: 22px;
    text-align: center;
    opacity: .15
}

.list_color li.activated .color {
    opacity: 1;
    border: 1px solid #000
}

.list_color li.ready .color {
    opacity: 1
}

.color_preview {
    float: right;
    border: 1px solid #aaa;
    width: 400px;
    height: 435px;
    background-color: #ececec
}

.code_view {
    clear: both;
    padding-top: 20px
}

.btn_pick {
    border: 0;
    background-color: #fff;
    padding: 0;
    display: inline;
    vertical-align: middle;
    cursor: pointer
}

.spuit {
    width: 25px;
    height: 25px;
    background-image: url(//t1.daumcdn.net/postcode/resource/images/wizard_icon.png);
    background-position: 0 -429px;
    vertical-align: bottom;
    display: block;
    zoom:1}

.guide_code {
    padding: 0 5px;
    border: 1px solid #ddd;
    border-radius: 3px;
    background-color: #fff;
    margin-bottom: 20px
}

.layer_guide {
    cursor: pointer;
    display: block;
    opacity: 0;
    z-index: 12;
    width: 230px;
    height: 80px;
    position: absolute;
    right: 80px;
    top: 30px;
    border: 2px solid #000;
    background-color: #fff;
    border-radius: 5px;
    -webkit-transition: opacity .2s;
    transition: opacity .2s;
    box-shadow: 3px 3px 10px rgba(85,85,85,.5),-1px 5px 10px rgba(85,85,85,.5)
}

.layer_guide.show {
    opacity: 1
}

.layer_guide p {
    position: absolute;
    margin: 0;
    padding: 10px;
    border-radius: 5px;
    background-color: #fff;
    font-size: 13px;
    text-align: left;
    line-height: 20px
}

.layer_guide:before {
    content: "";
    display: block;
    position: absolute;
    top: -25px;
    left: 102px;
    border-color: transparent transparent transparent #000;
    border-style: solid;
    border-width: 10px 15px;
    width: 0;
    height: 0;
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    -ms-transform: rotate(-90deg);
    -o-transform: rotate(-90deg);
    transform: rotate(-90deg);
    z-index: 14
}

.layer_guide:after {
    content: "";
    display: block;
    position: absolute;
    opacity: .2;
    top: -28px;
    left: 103px;
    border-color: transparent transparent transparent #555;
    border-style: solid;
    border-width: 9px 14px;
    width: 0;
    height: 0;
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    -ms-transform: rotate(-90deg);
    -o-transform: rotate(-90deg);
    transform: rotate(-90deg);
    z-index: 13
}

.layer_guide.narrow {
    height: 100px;
    box-shadow: 10px 10px 20px rgba(85,85,85,.7),-10px 10px 20px rgba(85,85,85,.7)
}

.layer_guide.narrow:after,.layer_guide.narrow:before {
    display: none
}

.layer_guide .type1 {
    display: block
}

.layer_guide .type2,.layer_guide.narrow .type1 {
    display: none
}

.layer_guide.narrow .type2 {
    display: block
}

#menuList li>a[href='#upgrade'].change {
    color: #fff;
    -webkit-animation: changeColor 3s ease;
    -moz-animation: changeColor 3s ease;
    animation: changeColor 3s ease
}

@-webkit-keyframes changeColor {
    0% {
        color: #fff
    }

    70% {
        color: #fa4257
    }

    100% {
        color: #fff
    }
}

@-moz-keyframes changeColor {
    0% {
        color: #fff
    }

    70% {
        color: #fa4257
    }

    100% {
        color: #fff
    }
}

@keyframes changeColor {
    0% {
        color: #fff
    }

    70% {
        color: #fa4257
    }

    100% {
        color: #fff
    }
}

@media (max-width: 900px) {
    #header {
        padding-top:5px
    }

    #logo {
        width: 115px
    }

    #menu {
        display: none
    }

    .wrap {
        width: auto;
        margin: 0 20px
    }

    .d_form.large {
        width: 100%
    }

    .devide {
        width: 100%;
        float: none
    }

    .arrow:after {
        content: 'â†“';
        font-size: 14px;
        margin-left: 10px
    }

    .colorset {
        margin: 0 auto 5px
    }

    #preview {
        float: none;
        margin: 15px auto
    }

    .color_preview {
        float: none;
        margin: 20px auto
    }

    .code_view {
        padding-top: 0
    }
}

@media (max-width: 420px) {
    .theme_wizard .code_view,.theme_wizard .control {
        display:none
    }

    .theme_wizard .alert_text {
        display: block
    }

    #preview {
        width: 100%;
        min-width: 300px
    }

    table.compare th,table.docs th {
        display: none
    }

    table.compare td,table.docs td {
        display: block;
        width: auto!important;
        padding-left: 80px;
        position: relative;
        min-height: 1.6em
    }

    table.compare td:before,table.docs td:before {
        position: absolute;
        left: 0;
        font-weight: 700
    }

    table.compare td:last-child,table.docs td:last-child {
        border-color: #000
    }

    table.compare td:first-child:before,table.docs td:first-child:before {
        content: 'í•­ëª©'
    }

    table.docs td:nth-child(2):before {
        content: 'ê°’'
    }

    table.compare td:last-child:before,table.docs td:last-child:before {
        content: 'ì„¤ëª…'
    }

    table.compare td:nth-child(2):before {
        content: 'ì´ì „ ë²„ì „'
    }

    table.compare td:nth-child(3):before {
        content: 'ì‹ ê·œ ë²„ì „'
    }
}
</style>
</head>
<body>
	<li style="padding: 0px"><div class="dt">주소 *</div>
		<div class="dd">
			<input type="text" id="postcode" class="form_style" name="postNum"
				style="width: 150px" placeholder="우편번호 *" readonly value="${ map.stayVO.postNum }"> <input
				type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"
				class="d_btn">
		</div></li>
	<li style="padding: 0px"><div class="dt"></div>
		<div class="dd">
			<div id="wrap"
				style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
					id="btnFoldWrap"
					style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
					onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
		</div></li>
	<li><div class="dt"></div>
		<div class="dd">
			<input type="text" id="address" name="stayAdress" class="form_style"
				placeholder="주소 *" readonly value="${ map.stayVO.stayAdress }">
		</div></li>
	<li style="padding-top: 0px"><div class="dt"></div>
		<div class="dd">
			<input type="text" id="detailAddress" class="form_style" name="detailAds"
				placeholder="상세주소" value="${ map.stayVO.detailAds }">
		</div></li>
	<li style="padding-top: 0px"><div class="dt"></div>
		<div class="dd">
			<input type="text" id="extraAddress" class="form_style" name="refs"
				placeholder="참고항목" value="${ map.stayVO.refs }">
		</div></li>



	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
    	document.querySelector('#postcode').style.backgroundColor='white';
    	
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
</body>
</html>
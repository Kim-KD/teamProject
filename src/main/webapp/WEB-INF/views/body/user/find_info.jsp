<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<style>
#findIdAndPwd{padding: 100px}
#sendFindNum{margin-left: 44%; padding: 10px}
</style>
<script src="resources/data-components/user/find_info.js"></script>
	<section class="site-section" id="findIdAndPwd">
      <div class="container">
        <div class="row">
        <div class="col-lg-6">
            <h2 class="mb-4">아이디 찾기</h2>
            <form class="p-4 border rounded" id="idFrm">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">E-mail</label>
                  <span id="id_email_msg"></span>
                  <input type="text" id="id_user_email" name="user_email" class="form-control" placeholder="E-mail 입력">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">이름</label>
                  <span id="id_name_msg"></span>
                  <input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                <input type="hidden" name="_csrf" value="${_csrf.token}"><br>
                  <button type="button" id="findIdBtn" class="btn px-4 btn-primary text-white">아이디 찾기</button>
                </div>
              </div>
            </form>
          </div>
          
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">비밀번호 찾기</h2>
            <form class="p-4 border rounded" id="pwdFrm">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">아이디</label>
                  <span id="pwd_id_msg"></span>
                  <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">E-mail</label>
                  <span id="pwd_email_msg"></span>
                  <input type="text" id="pwd_user_email" name="user_email" class="form-control" placeholder="E-mail 입력">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">인증번호</label>
                  <span id="pwd_num_msg"></span>
                  <input type="text" id="find_num" name="find_num" class="form-control" placeholder="인증번호 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                <input type="hidden" name="_csrf" value="${_csrf.token}"><br>
                  <button type="button" id="findPwdBtn" class="btn px-4 btn-primary text-white">비밀번호 찾기</button>
                  <button type="button" id="sendFindNum">인증번호 받기</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>

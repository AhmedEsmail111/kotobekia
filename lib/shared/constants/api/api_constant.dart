class ApiConstant{
  static const baseurl='https://kotobekia-backend.onrender.com/api';

  static const getConversation='/v1/conversations/get';
  static const sendMessage='/v1/messages/send-message';
  static const openConversation='/v1/conversations/open-conversation';
  static const getSpecificCategoryMethodUrl = '/v1/levels/specific/';
  static const userCreateAccountUrl='/v1/auth/signUp';
  static const userLoginUrl='/v1/auth/logIn';
  static const verifyOtp='/v1/auth/verify-OTP';
  static const resendOtp='/v1/auth/reSend-OTP';
  static const getHomePostMethodUrl = '/v1/levels/levels-posts';
  static const addNewPostUrlMethod = '/v1/posts';
  static String getMessage(String id)=>'/v1/messages/get/$id';
}

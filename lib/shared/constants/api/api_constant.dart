class ApiConstant {
  static const baseurl = 'https://kotobekia-back.onrender.com/api';

  static const getConversation = '/v1/conversations/get';
  static const sendMessage = '/v1/messages/send-message';
  static const openConversation = '/v1/conversations/open-conversation';
  static const getSpecificCategoryMethodUrl = '/v1/levels/specific/';
  static const userCreateAccountUrl = '/v1/auth/signUp';
  static const userLoginUrl = '/v1/auth/logIn';
  static const verifyOtp = '/v1/auth/verify-OTP';
  static const resendOtp = '/v1/auth/reSend-OTP';
  static const getHomePostMethodUrl = '/v1/levels/levels-posts';
  static const addNewPostUrlMethod = '/v1/posts';
  static const addToFavMethodUrl = '/v1/posts/add-to-favorite/';
  static const removeFromFavMethodUrl = '/v1/posts/remove-from-favorite/';
  static const getFavPostsMethodUrl = '/v1/user/favorites';
  static const getUserPostsMethodUrl = '/v1/user/my-posts';
  static const getSpecificUserMethodUrl = '/v1/user/specific/';
  static String getMessage(String id) => '/v1/messages/get/$id';
  static const reportMethodUrl = '/v1/reports/report';
  static const updateUserMethodUrl = '/v1/user/update/';
  static const searchMethodUrl = '/v1/posts/search';
}

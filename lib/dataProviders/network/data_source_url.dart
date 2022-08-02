class DataSourceURL {

    // static String baseUrl = 'http://192.168.43.130/temmam/resturant/';
    // static String baseUrl = 'http://192.168.1.102/temmam/resturant/';
    // static String baseUrl = 'http://192.168.137.1/temmam/resturant/';
    // static String baseUrl = 'http://10.0.2.2/temmam/resturant/';
    // static String baseUrl = 'http://192.168.43.130/temmam/RestuarantsSystem/public/api/';

     static String baseUrl = 'http://172.64.59.70/api/';
    // static String baseUrl = 'https://temmam.com/testing/RestuarantsSystem/api/';

     static String login='login';

     static String signup='register/sighup';


    // static String mainMenuOffers = 'mainMenuOffers.php';
    static String mainMenuOffers = 'get/offers';
    // static String mainMenuCategories = 'mainMenuCategories.php';
    static String mainMenuCategories = 'get/categories';
    // static String mainMenuFrequentlyOrderedItems = 'MainMenuFrequentlyOrderedItems.php';
    static String mainMenuFrequentlyOrderedItems = 'get/products/best';
    static String images = '';

    static String isRestaurantOpened = 'app_info/check/work_hours';
    // static String isRestaurantOpened = 'app_info/check/work_hours';

    // static String offerDetails = 'offerDetails.php';
    static String offerDetails = 'get/offers/contents';


    // static String offerOptions = 'offerOptions.php';
    static String offerOptions = 'get/offers/details';


    // static String categoryItems = 'categoryItems.php';
    static String categoryItems = 'get/products';



    // static String categoryItemOptions = 'categoryItemOptions.php';
    static String categoryItemOptions = 'get/product';


    // static String sendCart = 'sendCart.php';
    static String sendCart = 'customer/add/order';



    // static String registration = 'registration.php';
    //static String login = 'customer/registration';

    // static String register = 'register.php';
    static String register = 'customer/signup';

    // static String updateUser = 'updateUser.php';
    static String updateUser = 'customer/profile/update';


    // static String termsAndConditions = 'termsAndConditions.php';
    static String termsAndConditions = 'app_info/terms';


    // static String forgetPasswordCode = 'forgetPasswordCode.php';
    static String forgetPasswordCode = 'customer/forget/password';


    static String verifyForgetPasswordCode = 'customer/forget/password/code';
    // static String verifyForgetPasswordCode = 'verifyForgetPasswordCode.php';


    // static String resetPassword = 'resetPassword.php';
    static String resetPassword = 'customer/edit/password';

    static String resendForgetPasswordCode = 'customer/forget/password';


    // static String cities = 'cities.php';
    static String cities = 'app_info/cities';
    static String districts = 'app_info/districts';
    // static String locationCost = 'locationCost.php';
    static String locationCost = 'delivery/price';



    // static String userLocations = 'userLocations.php';
    static String userLocations = 'customer/get/addresses';


    // static String addNewUserLocation = 'addNewUserLocation.php';
    static String addNewUserLocation = 'customer/add/address';


    // static String updateUserLocation = 'updateUserLocation.php';
    static String updateUserLocation = 'customer/edit/address';



    // static String deleteUserLocation = 'deleteUserLocation.php';
    static String deleteUserLocation = 'customer/delete/address';


    // static String orderStatus = 'orderStatus.php';
    static String orderStatus = 'get/order/status';


    // static String about = 'about.php';
    static String about = 'app_info/about_us';

    // static String contacts = 'contacts.php';
    static String contacts = 'app_info/contacts';


    static String myOrders = 'customer/orders';

    // static String search = 'search.php';
    static String search = 'get/products/search';


}

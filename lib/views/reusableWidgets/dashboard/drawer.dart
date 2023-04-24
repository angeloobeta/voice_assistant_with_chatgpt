import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget drawer(context,
    {required Widget child, AdvancedDrawerController? controller}) {
  return AdvancedDrawer(
    backdropColor: black,
    controller: controller,
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    // openScale: 1.0,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
      // NOTICE: Uncomment if you want to add shadow behind the page.
      // Keep in mind that it may cause animation jerks.
      // boxShadow: <BoxShadow>[
      //   BoxShadow(
      //     color: Colors.black12,
      //     blurRadius: 0.0,
      //   ),
      // ],
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
    child: child,
    drawer: SafeArea(
      child: S(
        h: 768,
        w: 375,
        child: Stack(
          children: [
            // menu
            rowPositioned(
                child: const GeneralTextDisplay(
                    "Menu", white, 1, 19.08, FontWeight.w500, "500"),
                top: 22,
                left: 24),
            // edit profile
            drawerItem(Icons.account_box_rounded, "Edit Profile", 78),
            // edit profile
            drawerItem(Icons.lock, "Pin management", 126, onTap: () {
              // close the drawer before living the page
              controller!.hideDrawer();
              Navigator.pushNamed(context, '/pinManagement');
            }),
            // account
            drawerItem(Icons.account_balance_wallet_rounded, "Accounts", 174),
            // statement
            drawerItem(
                FontAwesomeIcons.fileInvoice, "Statement & Reports", 222),
            // link account
            drawerItem(
                FontAwesomeIcons.arrowUpRightFromSquare, "Link Accounts", 270),
            drawerItem(FontAwesomeIcons.userGear, "Customer Support", 318,
                onTap: () {
              // close the drawer before living the page
              controller!.hideDrawer();
              Navigator.pushNamed(context, "/customerSupport");
            }),
            // security
            drawerItem(
              Icons.lock,
              "Security Settings",
              366,
            ),
            //  referral
            drawerItem(Icons.group, "Referrals", 414, onTap: () {
              // close the drawer before living the page
              controller!.hideDrawer();
              Navigator.pushNamed(context, '/referralHomePage');
            }),
            // terms of use
            drawerItem(Icons.info, "Terms of Use", 462),

            // sign out
            drawerItem(Icons.logout_rounded, "Sign Out", 622,
                color: const Color.fromRGBO(255, 41, 41, 1), onTap: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: S(
                    h: 200,
                    w: 200,
                    child: customDialog(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loading(),
                            S(h: 20),
                            const GeneralTextDisplay(
                              "Signing user out",
                              white,
                              3,
                              14,
                              FontWeight.w500,
                              "",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        align: Alignment.center),
                  ),
                ),
              );
              Navigator.pushNamedAndRemoveUntil(
                  context, "/signIn", (route) => false);
            }),
            // version
            rowPositioned(
                child: GeneralTextDisplay(
                  "Ver 1.0.0",
                  white.withOpacity(0.5),
                  1,
                  14,
                  FontWeight.w500,
                  "version",
                  letterSpacing: 0.8,
                ),
                top: 657,
                left: 24)
          ],
        ),
      ),
    ),
  );
}

Widget drawerItem(IconData icon, String name, double top,
    {Color? color, Function? onTap}) {
  return rowPositioned(
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Row(
          children: [
            Center(
                child:
                    GeneralIconDisplay(icon, color ?? green, UniqueKey(), 16)),
            S(w: 14),
            GeneralTextDisplay(
              name,
              color ?? white,
              1,
              14,
              FontWeight.w500,
              "text",
              letterSpacing: 0.8,
            ),
          ],
        ),
      ),
      top: top,
      left: 24);
}

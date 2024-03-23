#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.plugin.editing.** { *; }

#pluggins
-keep class com.google.firebase.** { *; }
-keep class flutter.plugins.** { *; }
-keep class dev.fluttercommunity.** { *; }
-keep class com.tekartik.** { *; }
-keep class net.touchcapture.** { *; }
-keep class com.baseflow.** { *; }
-keep class dev.flutter.** { *; }
-keep class com.it_nomads.** { *; }
-keep class com.dexterous.** { *; }
-keep class com.jrai.** { *; }
-keep class dev.flutter.** { *; }
-keep class bo.app.** { *; }
-keep public class com.android.installreferrer.** { *; }

#-keep class password.com.BuildConfig { *; }


-keep class com.google.android.gms.common.ConnectionResult {
    int SUCCESS;
}

-keep class com.google.android.gms.ads.identifier.AdvertisingIdClient {
    com.google.android.gms.ads.identifier.AdvertisingIdClient$Info getAdvertisingIdInfo(android.content.Context);
}

-keep class com.google.android.gms.ads.identifier.AdvertisingIdClient$Info {
    java.lang.String getId();
    boolean isLimitAdTrackingEnabled();
}


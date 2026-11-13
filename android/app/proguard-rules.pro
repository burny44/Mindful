-keep class androidx.lifecycle.DefaultLifecycleObserver
-keepattributes LineNumberTable,SourceFile
-renamesourcefileattribute SourceFile
# WorkManager instantiates its Room database reflectively; R8 full mode (AGP 9)
# strips the generated no-arg constructor otherwise -> crash on startup.
-keep class * extends androidx.room.RoomDatabase { <init>(); }
-keep class androidx.work.impl.WorkDatabase_Impl { *; }

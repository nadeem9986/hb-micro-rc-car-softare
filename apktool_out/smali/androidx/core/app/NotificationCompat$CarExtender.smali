.class public final Landroidx/core/app/NotificationCompat$CarExtender;
.super Ljava/lang/Object;
.source "NotificationCompat.java"

# interfaces
.implements Landroidx/core/app/NotificationCompat$Extender;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CarExtender"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;
    }
.end annotation


# static fields
.field static final EXTRA_CAR_EXTENDER:Ljava/lang/String; = "android.car.EXTENSIONS"

.field private static final EXTRA_COLOR:Ljava/lang/String; = "app_color"

.field private static final EXTRA_CONVERSATION:Ljava/lang/String; = "car_conversation"

.field static final EXTRA_INVISIBLE_ACTIONS:Ljava/lang/String; = "invisible_actions"

.field private static final EXTRA_LARGE_ICON:Ljava/lang/String; = "large_icon"

.field private static final KEY_AUTHOR:Ljava/lang/String; = "author"

.field private static final KEY_MESSAGES:Ljava/lang/String; = "messages"

.field private static final KEY_ON_READ:Ljava/lang/String; = "on_read"

.field private static final KEY_ON_REPLY:Ljava/lang/String; = "on_reply"

.field private static final KEY_PARTICIPANTS:Ljava/lang/String; = "participants"

.field private static final KEY_REMOTE_INPUT:Ljava/lang/String; = "remote_input"

.field private static final KEY_TEXT:Ljava/lang/String; = "text"

.field private static final KEY_TIMESTAMP:Ljava/lang/String; = "timestamp"


# instance fields
.field private mColor:I

.field private mLargeIcon:Landroid/graphics/Bitmap;

.field private mUnreadConversation:Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 6175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 6170
    iput v0, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mColor:I

    return-void
.end method

.method public constructor <init>(Landroid/app/Notification;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "notification"
        }
    .end annotation

    .line 6183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 6170
    iput v0, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mColor:I

    .line 6184
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_0

    return-void

    .line 6188
    :cond_0
    invoke-static {p1}, Landroidx/core/app/NotificationCompat;->getExtras(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    .line 6189
    :cond_1
    invoke-static {p1}, Landroidx/core/app/NotificationCompat;->getExtras(Landroid/app/Notification;)Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "android.car.EXTENSIONS"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_2

    .line 6191
    const-string v1, "large_icon"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mLargeIcon:Landroid/graphics/Bitmap;

    .line 6192
    const-string v1, "app_color"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mColor:I

    .line 6194
    const-string v0, "car_conversation"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 6195
    invoke-static {p1}, Landroidx/core/app/NotificationCompat$CarExtender;->getUnreadConversationFromBundle(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;

    move-result-object p1

    iput-object p1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mUnreadConversation:Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;

    :cond_2
    return-void
.end method

.method private static getBundleForUnreadConversation(Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;)Landroid/os/Bundle;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uc"
        }
    .end annotation

    .line 6255
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 6257
    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    const/4 v3, 0x1

    if-le v1, v3, :cond_0

    .line 6258
    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 6260
    :goto_0
    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getMessages()[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    new-array v4, v3, [Landroid/os/Parcelable;

    :goto_1
    if-ge v2, v3, :cond_1

    .line 6262
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 6263
    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getMessages()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v2

    const-string v7, "text"

    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6264
    const-string v6, "author"

    invoke-virtual {v5, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6265
    aput-object v5, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 6267
    :cond_1
    const-string v1, "messages"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 6268
    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getRemoteInput()Landroidx/core/app/RemoteInput;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 6270
    new-instance v2, Landroid/app/RemoteInput$Builder;

    .line 6271
    invoke-virtual {v1}, Landroidx/core/app/RemoteInput;->getResultKey()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/RemoteInput$Builder;-><init>(Ljava/lang/String;)V

    .line 6272
    invoke-virtual {v1}, Landroidx/core/app/RemoteInput;->getLabel()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v2, v3}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput$Builder;Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    .line 6273
    invoke-virtual {v1}, Landroidx/core/app/RemoteInput;->getChoices()[Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v2, v3}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput$Builder;[Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    .line 6274
    invoke-virtual {v1}, Landroidx/core/app/RemoteInput;->getAllowFreeFormInput()Z

    move-result v3

    invoke-static {v2, v3}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput$Builder;Z)Landroid/app/RemoteInput$Builder;

    move-result-object v2

    .line 6275
    invoke-virtual {v1}, Landroidx/core/app/RemoteInput;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput$Builder;Landroid/os/Bundle;)Landroid/app/RemoteInput$Builder;

    move-result-object v1

    .line 6276
    invoke-static {v1}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput$Builder;)Landroid/app/RemoteInput;

    move-result-object v1

    .line 6277
    const-string v2, "remote_input"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6279
    :cond_2
    const-string v1, "on_reply"

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getReplyPendingIntent()Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6280
    const-string v1, "on_read"

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getReadPendingIntent()Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6281
    const-string v1, "participants"

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getParticipants()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 6282
    const-string v1, "timestamp"

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;->getLatestTimestamp()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-object v0
.end method

.method private static getUnreadConversationFromBundle(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;
    .locals 21
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    move-object/from16 v0, p0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 6204
    :cond_0
    const-string v2, "messages"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 6207
    array-length v4, v2

    new-array v5, v4, [Ljava/lang/String;

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_3

    .line 6210
    aget-object v7, v2, v6

    instance-of v8, v7, Landroid/os/Bundle;

    if-nez v8, :cond_1

    goto :goto_1

    .line 6214
    :cond_1
    check-cast v7, Landroid/os/Bundle;

    const-string v8, "text"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    if-nez v7, :cond_2

    :goto_1
    return-object v1

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    move-object v8, v5

    goto :goto_2

    :cond_4
    move-object v8, v1

    .line 6227
    :goto_2
    const-string v2, "on_read"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/app/PendingIntent;

    .line 6228
    const-string v2, "on_reply"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Landroid/app/PendingIntent;

    .line 6230
    const-string v2, "remote_input"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/app/RemoteInput;

    move-result-object v2

    .line 6232
    const-string v4, "participants"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_8

    .line 6233
    array-length v4, v12

    const/4 v5, 0x1

    if-eq v4, v5, :cond_5

    goto :goto_4

    :cond_5
    if-eqz v2, :cond_7

    .line 6238
    new-instance v1, Landroidx/core/app/RemoteInput;

    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput;)Ljava/lang/String;

    move-result-object v14

    .line 6239
    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput;)Ljava/lang/CharSequence;

    move-result-object v15

    .line 6240
    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput;)[Ljava/lang/CharSequence;

    move-result-object v16

    .line 6241
    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput;)Z

    move-result v17

    .line 6242
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1d

    if-lt v4, v5, :cond_6

    .line 6243
    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput;)I

    move-result v3

    move/from16 v18, v3

    goto :goto_3

    :cond_6
    const/16 v18, 0x0

    .line 6245
    :goto_3
    invoke-static {v2}, Landroidx/core/app/NotificationCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/RemoteInput;)Landroid/os/Bundle;

    move-result-object v19

    const/16 v20, 0x0

    move-object v13, v1

    invoke-direct/range {v13 .. v20}, Landroidx/core/app/RemoteInput;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;[Ljava/lang/CharSequence;ZILandroid/os/Bundle;Ljava/util/Set;)V

    :cond_7
    move-object v9, v1

    .line 6249
    new-instance v1, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;

    const-string v2, "timestamp"

    .line 6250
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v13

    move-object v7, v1

    invoke-direct/range {v7 .. v14}, Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;-><init>([Ljava/lang/String;Landroidx/core/app/RemoteInput;Landroid/app/PendingIntent;Landroid/app/PendingIntent;[Ljava/lang/String;J)V

    :cond_8
    :goto_4
    return-object v1
.end method


# virtual methods
.method public extend(Landroidx/core/app/NotificationCompat$Builder;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    .line 6294
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    return-object p1

    .line 6298
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 6300
    iget-object v1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mLargeIcon:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    .line 6301
    const-string v2, "large_icon"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6303
    :cond_1
    iget v1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mColor:I

    if-eqz v1, :cond_2

    .line 6304
    const-string v2, "app_color"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 6307
    :cond_2
    iget-object v1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mUnreadConversation:Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;

    if-eqz v1, :cond_3

    .line 6308
    invoke-static {v1}, Landroidx/core/app/NotificationCompat$CarExtender;->getBundleForUnreadConversation(Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;)Landroid/os/Bundle;

    move-result-object v1

    .line 6309
    const-string v2, "car_conversation"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 6312
    :cond_3
    invoke-virtual {p1}, Landroidx/core/app/NotificationCompat$Builder;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "android.car.EXTENSIONS"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object p1
.end method

.method public getColor()I
    .locals 1

    .line 6336
    iget v0, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mColor:I

    return v0
.end method

.method public getLargeIcon()Landroid/graphics/Bitmap;
    .locals 1

    .line 6360
    iget-object v0, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mLargeIcon:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getUnreadConversation()Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 6388
    iget-object v0, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mUnreadConversation:Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;

    return-object v0
.end method

.method public setColor(I)Landroidx/core/app/NotificationCompat$CarExtender;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "color"
        }
    .end annotation

    .line 6325
    iput p1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mColor:I

    return-object p0
.end method

.method public setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$CarExtender;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "largeIcon"
        }
    .end annotation

    .line 6349
    iput-object p1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mLargeIcon:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public setUnreadConversation(Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;)Landroidx/core/app/NotificationCompat$CarExtender;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "unreadConversation"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 6375
    iput-object p1, p0, Landroidx/core/app/NotificationCompat$CarExtender;->mUnreadConversation:Landroidx/core/app/NotificationCompat$CarExtender$UnreadConversation;

    return-object p0
.end method

.class Landroidx/core/view/ViewCompat$CompatImplApi28;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/ViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CompatImplApi28"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 4001
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addOnUnhandledKeyEventListener(Landroid/view/View;Landroidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10
        }
        names = {
            "v",
            "listener"
        }
    .end annotation

    .line 4008
    sget v0, Landroidx/core/R$id;->tag_unhandled_key_listeners:I

    .line 4010
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/collection/SimpleArrayMap;

    if-nez v0, :cond_0

    .line 4012
    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    .line 4013
    sget v1, Landroidx/core/R$id;->tag_unhandled_key_listeners:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 4016
    :cond_0
    new-instance v1, Landroidx/core/view/ViewCompat$CompatImplApi28$1;

    invoke-direct {v1, p1}, Landroidx/core/view/ViewCompat$CompatImplApi28$1;-><init>(Landroidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat;)V

    .line 4023
    invoke-virtual {v0, p1, v1}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4024
    invoke-static {p0, v1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/View;Landroid/view/View$OnUnhandledKeyEventListener;)V

    return-void
.end method

.method static removeOnUnhandledKeyEventListener(Landroid/view/View;Landroidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "v",
            "listener"
        }
    .end annotation

    .line 4031
    sget v0, Landroidx/core/R$id;->tag_unhandled_key_listeners:I

    .line 4033
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/collection/SimpleArrayMap;

    if-nez v0, :cond_0

    return-void

    .line 4037
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Ljava/lang/Object;)Landroid/view/View$OnUnhandledKeyEventListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 4039
    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$1(Landroid/view/View;Landroid/view/View$OnUnhandledKeyEventListener;)V

    :cond_1
    return-void
.end method

.class Lcom/dcloud/android/v4/view/ViewPropertyAnimatorCompatLollipop;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static translationZ(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$3(Landroid/view/ViewPropertyAnimator;F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public static translationZBy(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$2(Landroid/view/ViewPropertyAnimator;F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public static z(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$1(Landroid/view/ViewPropertyAnimator;F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public static zBy(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-static {p0, p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/ViewPropertyAnimator;F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

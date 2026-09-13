.class Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;
.super Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl;
.source "WindowInsetsAnimationControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsAnimationControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Impl30"
.end annotation


# instance fields
.field private final mController:Landroid/view/WindowInsetsAnimationController;


# direct methods
.method constructor <init>(Landroid/view/WindowInsetsAnimationController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "controller"
        }
    .end annotation

    .line 298
    invoke-direct {p0}, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl;-><init>()V

    .line 299
    iput-object p1, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    return-void
.end method


# virtual methods
.method finish(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "shown"
        }
    .end annotation

    .line 345
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0, p1}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/WindowInsetsAnimationController;Z)V

    return-void
.end method

.method public getCurrentAlpha()F
    .locals 1

    .line 327
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$1(Landroid/view/WindowInsetsAnimationController;)F

    move-result v0

    return v0
.end method

.method public getCurrentFraction()F
    .locals 1

    .line 322
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/WindowInsetsAnimationController;)F

    move-result v0

    return v0
.end method

.method public getCurrentInsets()Landroidx/core/graphics/Insets;
    .locals 1

    .line 317
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$2(Landroid/view/WindowInsetsAnimationController;)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public getHiddenStateInsets()Landroidx/core/graphics/Insets;
    .locals 1

    .line 305
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/WindowInsetsAnimationController;)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public getShownStateInsets()Landroidx/core/graphics/Insets;
    .locals 1

    .line 311
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$1(Landroid/view/WindowInsetsAnimationController;)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public getTypes()I
    .locals 1

    .line 332
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/WindowInsetsAnimationController;)I

    move-result v0

    return v0
.end method

.method isCancelled()Z
    .locals 1

    .line 360
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$2(Landroid/view/WindowInsetsAnimationController;)Z

    move-result v0

    return v0
.end method

.method isFinished()Z
    .locals 1

    .line 355
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m$1(Landroid/view/WindowInsetsAnimationController;)Z

    move-result v0

    return v0
.end method

.method public isReady()Z
    .locals 1

    .line 350
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    invoke-static {v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/WindowInsetsAnimationController;)Z

    move-result v0

    return v0
.end method

.method public setInsetsAndAlpha(Landroidx/core/graphics/Insets;FF)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "insets",
            "alpha",
            "fraction"
        }
    .end annotation

    .line 337
    iget-object v0, p0, Landroidx/core/view/WindowInsetsAnimationControllerCompat$Impl30;->mController:Landroid/view/WindowInsetsAnimationController;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/core/graphics/Insets;->toPlatformInsets()Landroid/graphics/Insets;

    move-result-object p1

    :goto_0
    invoke-static {v0, p1, p2, p3}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/WindowInsetsAnimationController;Landroid/graphics/Insets;FF)V

    return-void
.end method

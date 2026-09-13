.class Lcom/dcloud/android/v4/view/ViewCompatLollipop;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dispatchApplyWindowInsets(Landroid/view/View;Lcom/dcloud/android/v4/view/WindowInsetsCompat;)Lcom/dcloud/android/v4/view/WindowInsetsCompat;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;

    if-eqz v0, :cond_0

    .line 3
    move-object v0, p1

    check-cast v0, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;

    invoke-virtual {v0}, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;->unwrap()Landroid/view/WindowInsets;

    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    if-eq p0, v0, :cond_0

    .line 9
    new-instance p1, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;

    invoke-direct {p1, p0}, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;-><init>(Landroid/view/WindowInsets;)V

    :cond_0
    return-object p1
.end method

.method public static dispatchNestedFling(Landroid/view/View;FFZ)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/View;FFZ)Z

    move-result p0

    return p0
.end method

.method public static dispatchNestedPreFling(Landroid/view/View;FF)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;FF)Z

    move-result p0

    return p0
.end method

.method public static dispatchNestedPreScroll(Landroid/view/View;II[I[I)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;II[I[I)Z

    move-result p0

    return p0
.end method

.method public static dispatchNestedScroll(Landroid/view/View;IIII[I)Z
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;IIII[I)Z

    move-result p0

    return p0
.end method

.method static getBackgroundTintList(Landroid/view/View;)Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method static getBackgroundTintMode(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p0

    return-object p0
.end method

.method public static getElevation(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;)F

    move-result p0

    return p0
.end method

.method public static getTransitionName(Landroid/view/View;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTranslationZ(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/view/View;)F

    move-result p0

    return p0
.end method

.method public static getZ(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/view/View;)F

    move-result p0

    return p0
.end method

.method public static hasNestedScrollingParent(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$6(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static isImportantForAccessibility(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$7(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static isNestedScrollingEnabled(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$4(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static onApplyWindowInsets(Landroid/view/View;Lcom/dcloud/android/v4/view/WindowInsetsCompat;)Lcom/dcloud/android/v4/view/WindowInsetsCompat;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;

    if-eqz v0, :cond_0

    .line 3
    move-object v0, p1

    check-cast v0, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;

    invoke-virtual {v0}, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;->unwrap()Landroid/view/WindowInsets;

    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    if-eq p0, v0, :cond_0

    .line 9
    new-instance p1, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;

    invoke-direct {p1, p0}, Lcom/dcloud/android/v4/view/WindowInsetsCompatApi21;-><init>(Landroid/view/WindowInsets;)V

    :cond_0
    return-object p1
.end method

.method public static requestApplyInsets(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/view/View;)V

    return-void
.end method

.method static setBackgroundTintList(Landroid/view/View;Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method static setBackgroundTintMode(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public static setElevation(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;F)V

    return-void
.end method

.method public static setNestedScrollingEnabled(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/view/View;Z)V

    return-void
.end method

.method public static setOnApplyWindowInsetsListener(Landroid/view/View;Lcom/dcloud/android/v4/view/OnApplyWindowInsetsListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/dcloud/android/v4/view/ViewCompatLollipop$1;

    invoke-direct {v0, p1}, Lcom/dcloud/android/v4/view/ViewCompatLollipop$1;-><init>(Lcom/dcloud/android/v4/view/OnApplyWindowInsetsListener;)V

    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat$$ExternalSyntheticApiModelOutline7;->m(Landroid/view/View;Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void
.end method

.method public static setTransitionName(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static setTranslationZ(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/view/View;F)V

    return-void
.end method

.method public static startNestedScroll(Landroid/view/View;I)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;I)Z

    move-result p0

    return p0
.end method

.method public static stopNestedScroll(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;)V

    return-void
.end method

.class Lcom/dcloud/android/v4/view/accessibility/AccessibilityNodeInfoCompatApi21;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dcloud/android/v4/view/accessibility/AccessibilityNodeInfoCompatApi21$CollectionItemInfo;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addAction(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object p1

    invoke-static {p0, p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    return-void
.end method

.method static getAccessibilityActionId(Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object p0

    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)I

    move-result p0

    return p0
.end method

.method static getAccessibilityActionLabel(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object p0

    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method static getActionList(Ljava/lang/Object;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getError(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m$4(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static getMaxTextLength(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;)I

    move-result p0

    return p0
.end method

.method public static getWindow(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityWindowInfo;

    move-result-object p0

    return-object p0
.end method

.method static newAccessibilityAction(ILjava/lang/CharSequence;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-direct {v0, p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    return-object v0
.end method

.method public static obtainCollectionInfo(IIZI)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(IIZI)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    move-result-object p0

    return-object p0
.end method

.method public static obtainCollectionItemInfo(IIIIZZ)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    move-result-object p0

    return-object p0
.end method

.method public static removeAction(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    move-result-object p1

    invoke-static {p0, p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)Z

    move-result p0

    return p0
.end method

.method public static removeChild(Ljava/lang/Object;Landroid/view/View;)Z
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0, p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static removeChild(Ljava/lang/Object;Landroid/view/View;I)Z
    .locals 0

    .line 2
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0, p1, p2}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/View;I)Z

    move-result p0

    return p0
.end method

.method public static setError(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0, p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static setMaxTextLength(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {p0, p1}, Landroidx/core/view/inputmethod/EditorInfoCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/accessibility/AccessibilityNodeInfo;I)V

    return-void
.end method

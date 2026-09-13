.class public final Lio/dcloud/base/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/dcloud/base/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static ActionSheet:[I = null

.field public static ActionSheet_actionSheetBackground:I = 0x0

.field public static ActionSheet_actionSheetPadding:I = 0x1

.field public static ActionSheet_actionSheetTextSize:I = 0x2

.field public static ActionSheet_cancelButtonBackground:I = 0x3

.field public static ActionSheet_cancelButtonMarginTop:I = 0x4

.field public static ActionSheet_cancelButtonTextColor:I = 0x5

.field public static ActionSheet_destructiveButtonTextColor:I = 0x6

.field public static ActionSheet_otherButtonBottomBackground:I = 0x7

.field public static ActionSheet_otherButtonMiddleBackground:I = 0x8

.field public static ActionSheet_otherButtonSingleBackground:I = 0x9

.field public static ActionSheet_otherButtonSpacing:I = 0xa

.field public static ActionSheet_otherButtonTextColor:I = 0xb

.field public static ActionSheet_otherButtonTitleBackground:I = 0xc

.field public static ActionSheet_otherButtonTopBackground:I = 0xd

.field public static ActionSheet_titleButtonTextColor:I = 0xe

.field public static ActionSheets:[I = null

.field public static ActionSheets_actionSheetStyle:I = 0x0

.field public static GIFVIEW:[I = null

.field public static GIFVIEW_authPlay:I = 0x0

.field public static GIFVIEW_gifSrc:I = 0x1

.field public static GIFVIEW_playCount:I = 0x2

.field public static IMGColorRadio:[I = null

.field public static IMGColorRadio_image_color:I = 0x0

.field public static IMGColorRadio_image_stroke_color:I = 0x1


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xf

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lio/dcloud/base/R$styleable;->ActionSheet:[I

    const v0, 0x7f020022

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lio/dcloud/base/R$styleable;->ActionSheets:[I

    const v0, 0x7f02009f

    const v1, 0x7f0200e4

    const v2, 0x7f020032

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lio/dcloud/base/R$styleable;->GIFVIEW:[I

    const v0, 0x7f0200aa

    const v1, 0x7f0200ad

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lio/dcloud/base/R$styleable;->IMGColorRadio:[I

    return-void

    :array_0
    .array-data 4
        0x7f020020
        0x7f020021
        0x7f020023
        0x7f02004e
        0x7f02004f
        0x7f020050
        0x7f02006d
        0x7f0200d2
        0x7f0200d3
        0x7f0200d4
        0x7f0200d5
        0x7f0200d6
        0x7f0200d7
        0x7f0200d8
        0x7f020150
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

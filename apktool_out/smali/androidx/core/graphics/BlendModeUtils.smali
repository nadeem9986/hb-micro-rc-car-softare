.class Landroidx/core/graphics/BlendModeUtils;
.super Ljava/lang/Object;
.source "BlendModeUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static obtainBlendModeFromCompat(Landroidx/core/graphics/BlendModeCompat;)Landroid/graphics/BlendMode;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "blendModeCompat"
        }
    .end annotation

    .line 35
    sget-object v0, Landroidx/core/graphics/BlendModeUtils$1;->$SwitchMap$androidx$core$graphics$BlendModeCompat:[I

    invoke-virtual {p0}, Landroidx/core/graphics/BlendModeCompat;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 93
    :pswitch_0
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$3()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 91
    :pswitch_1
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$1()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 89
    :pswitch_2
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$28()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 87
    :pswitch_3
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$27()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 85
    :pswitch_4
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$26()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 83
    :pswitch_5
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$25()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 81
    :pswitch_6
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$24()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 79
    :pswitch_7
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$23()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 77
    :pswitch_8
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$22()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 75
    :pswitch_9
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$11()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 73
    :pswitch_a
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$20()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 71
    :pswitch_b
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$19()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 69
    :pswitch_c
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$18()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 67
    :pswitch_d
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$17()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 65
    :pswitch_e
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$16()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 63
    :pswitch_f
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$15()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 61
    :pswitch_10
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$14()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 59
    :pswitch_11
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$13()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 57
    :pswitch_12
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$2()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 55
    :pswitch_13
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$12()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 53
    :pswitch_14
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$10()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 51
    :pswitch_15
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$9()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 49
    :pswitch_16
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$8()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 47
    :pswitch_17
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$7()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 45
    :pswitch_18
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$6()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 43
    :pswitch_19
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$5()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 41
    :pswitch_1a
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$4()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 39
    :pswitch_1b
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m$21()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    .line 37
    :pswitch_1c
    invoke-static {}, Landroidx/core/graphics/Insets$$ExternalSyntheticApiModelOutline0;->m()Landroid/graphics/BlendMode;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static obtainPorterDuffFromCompat(Landroidx/core/graphics/BlendModeCompat;)Landroid/graphics/PorterDuff$Mode;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "blendModeCompat"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 102
    sget-object v1, Landroidx/core/graphics/BlendModeUtils$1;->$SwitchMap$androidx$core$graphics$BlendModeCompat:[I

    invoke-virtual {p0}, Landroidx/core/graphics/BlendModeCompat;->ordinal()I

    move-result p0

    aget p0, v1, p0

    packed-switch p0, :pswitch_data_0

    return-object v0

    .line 139
    :pswitch_0
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->LIGHTEN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 137
    :pswitch_1
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 135
    :pswitch_2
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->OVERLAY:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 133
    :pswitch_3
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 131
    :pswitch_4
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 128
    :pswitch_5
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 126
    :pswitch_6
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->XOR:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 124
    :pswitch_7
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->DST_ATOP:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 122
    :pswitch_8
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 120
    :pswitch_9
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 118
    :pswitch_a
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_OUT:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 116
    :pswitch_b
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 114
    :pswitch_c
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 112
    :pswitch_d
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->DST_OVER:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 110
    :pswitch_e
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 108
    :pswitch_f
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->DST:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 106
    :pswitch_10
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    .line 104
    :pswitch_11
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    return-object p0

    :cond_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

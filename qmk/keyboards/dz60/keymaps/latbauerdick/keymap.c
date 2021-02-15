#include QMK_KEYBOARD_H

enum alt_layers {
  _COLEMAK,
  /* _QWERTY, */
  _RAISE,
  _NAV,
  _ADJ
};

#define CTL_ESC  MT(MOD_LCTL, KC_ESC)
#define RSF_SLS  MT(MOD_RSFT, KC_SLSH)
#define RSF_UP   MT(MOD_RSFT, KC_UP)
#define RSF_ENT  MT(MOD_RSFT, KC_ENT)
#define GUI_SPC  MT(MOD_LGUI, KC_SPC)
#define RSE_SPC  LT(_RAISE, KC_SPC)
#define ADJ_SPC  LT(_ADJ, KC_SPC)
#define NAV_A    LT(_NAV, KC_A)
#define NAV_O    LT(_NAV, KC_O)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_COLEMAK] = LAYOUT(
          KC_GESC, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_GRV , KC_7,    KC_8,    KC_9,    KC_0   , KC_MINS, KC_EQL , KC_BSPC,
          KC_TAB,  KC_Q,    KC_W,    KC_F,    KC_P,    KC_B,    KC_LBRC, KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, KC_QUOT, KC_BSLS,
          CTL_ESC, NAV_A,   KC_R,    KC_S,    KC_T,    KC_G,    KC_RBRC, KC_M,    KC_N,    KC_E,    KC_I,    NAV_O,            KC_ENT,
 KC_LSFT, KC_LSFT, KC_X,    KC_C,    KC_D,    KC_V,    KC_Z,    KC_SLSH, KC_K,    KC_H,    KC_COMM, KC_DOT,           KC_RSFT,          ADJ_SPC,
          KC_LCTL, KC_LALT, KC_LGUI,          GUI_SPC,          RSF_ENT,          RSE_SPC,          KC_RGUI, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
    ),
    [_RAISE] = LAYOUT(
         _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
         KC_GRV , KC_EXLM, KC_AT  , KC_HASH, KC_DLR , KC_PERC, XXXXXXX, KC_CIRC, KC_AMPR, KC_ASTR, KC_PLUS, KC_COLN, _______, KC_SLSH,          \
         _______, KC_1   , KC_2   , KC_3   , KC_4   , KC_5   , XXXXXXX, KC_6   , KC_7   , KC_8   , KC_9   , KC_0   ,          _______,          \
_______, _______, KC_LBRC, KC_RBRC, KC_MINS, KC_EQL , KC_LPRN, KC_BSPC, KC_RPRN, KC_QUOT, _______, _______,          _______,          _______, \
         _______, _______, _______,          _______,          KC_BSPC,          _______,          _______, _______, _______, _______, _______  \
    ),
    [_NAV] = LAYOUT(
          _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
          _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, S(KC_J), XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, RESET  ,
          _______, XXXXXXX, KC_HOME, KC_PGUP, KC_PGDN, KC_END , XXXXXXX, KC_LEFT, KC_DOWN, KC_UP  , KC_RGHT, XXXXXXX,          _______,
 _______, _______, G(KC_X), G(KC_C), G(KC_D), G(KC_V), G(KC_Z), KC_BSPC, KC_LEFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,          _______,
          _______, _______, _______,          _______,          KC_BSPC,          _______,          _______, _______, KC_VOLD, KC_VOLU, _______
    ),
    [_ADJ] = LAYOUT(
        KC_GRV,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  _______, KC_DEL,
        _______, RGB_TOG, RGB_MOD, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, _______, _______, _______, _______, RESET,
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______,
        _______, _______, _______, _______, BL_DEC,  BL_TOGG, BL_INC,  BL_STEP, _______, _______, _______, _______, _______,          _______,
        _______, _______, _______,          _______,          _______,          _______,          _______, _______, KC_VOLD, KC_VOLU, _______
    ),
};

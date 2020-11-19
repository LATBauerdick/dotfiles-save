/* Copyright 2015-2017 Jack Humbert
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include QMK_KEYBOARD_H
#include "muse.h"

enum preonic_layers {
  _QWERTY,
  _COLEMAK,
  _COLEMAK1,
  _COLEMAK2,
  _LOWER,
  _RAISE,
  _NAV,
  _ADJUST
};

enum preonic_keycodes {
  QWERTY = SAFE_RANGE,
  COLEMAK,
  COLEMAK1,
  COLEMAK2,
  LOWER,
  RAISE,
  BACKLIT
};

//Tap Dance Declarations
enum {
  CT_QE = 0,
  CT_MV,
  CT_ED,
  CT_CLN,
  CT_DE,
  CT_GE,
  CT_JESC,
  X_TAP_DANCE
};

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)
#define NAV_A    LT(_NAV, KC_A)
#define NAV_O    LT(_NAV, KC_O)
#define NAV_SCLN LT(_NAV, KC_SCLN)
#define RSE_RGHT LT(_RAISE, KC_RGHT)
#define RSE_0    LT(_RAISE, KC_0)
#define RSE_SPC  LT(_RAISE, KC_SPC)
#define RSE_RET  LT(_RAISE, KC_ENT)
#define LOW_SPC  LT(_LOWER, KC_SPC)
#define LOW_ESC  LT(_LOWER, KC_ESC)
#define LOW_TAB  LT(_LOWER, KC_TAB)
#define LOW_RGHT LT(_LOWER, KC_RGHT)

#define CTL_ESC  MT(MOD_LCTL, KC_ESC)
#define CTL_TAB  MT(MOD_LCTL, KC_TAB)
#define CTL_SPC  MT(MOD_LCTL, KC_SPC)
#define CTL_QUT  MT(MOD_RCTL, KC_QUOT)
#define CTL_RET  MT(MOD_RCTL, KC_ENT)
#define GUI_LFT  MT(MOD_RGUI, KC_LEFT)
#define GUI_TAB  MT(MOD_LGUI, KC_TAB)
#define GUI_ESC  MT(MOD_LGUI, KC_ESC)
#define ALT_ESC  MT(MOD_LALT, KC_ESC)
#define LSF_SPC  MT(MOD_LSFT, KC_SPC)
#define LSF_TAB  MT(MOD_LSFT, KC_TAB)
#define LSF_RET  MT(MOD_LSFT, KC_ENT)
#define LSF_BSP  MT(MOD_LSFT, KC_BSPC)
#define RSF_SPC  MT(MOD_RSFT, KC_SPC)
#define RSF_BSP  MT(MOD_RSFT, KC_BSPC)
#define RSF_RET  MT(MOD_RSFT, KC_ENT)
#define TD_JESC  TD(CT_JESC)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * |  Esc |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |   ⇥  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc/^| A/NAV|   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  | ;/NAV|  '/⌃ |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |   ⇧  |   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  |Ret/⇧ |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Raise| Spc/^|Esc/⌥ |Tab/⌘ |Ret/⇧ |Spc/Lo|Spc/Lo|Spc/Rs|Left/⌘| Down |  Up  | ->/Lo|
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_preonic_grid( \
  TD(CT_GE),KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,     TD(CT_DE),
  KC_TAB,   KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,     KC_BSPC,
  CTL_ESC,  NAV_A,   KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    NAV_SCLN, RSF_RET,
  KC_LSFT,  KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH,  RSF_RET,
  RAISE,    CTL_SPC, ALT_ESC, GUI_TAB, LSF_RET, LOW_SPC, LOW_SPC, RSE_SPC, GUI_LFT, KC_DOWN, KC_UP,    LOW_RGHT
),

/* Colemak: derived from Colemak Mod-DH, switching KM and rotating BGV
 * (just switch DV and HM w/r to Colemak proper)
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | B/Esc|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |   ⇥  |   Q  |   W  |   F  |   P  |   B  |   J  |   L  |   U  |   Y  |   ;  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc/^| A/NAV|   R  |   S  |   T  |   G  |   M  |   N  |   E  |   I  | O/NAV| Ret/^|
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  (/⇧ |   X  |   C  |   V  |   D  |   V  |   K  |   H  |   ,  |   .  |   /  | Ret/⇧|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Lower| Spc/^|  ⌥   |   ⌘  | Lower| Space|Space |Raise |Left/⌘| Down |  Up  |->/Rse|
 * `-----------------------------------------------------------------------------------'
 */
[_COLEMAK] = LAYOUT_preonic_grid( \
  _______, KC_1,    KC_2,    KC_3,     KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    _______,
  _______, KC_Q,    KC_W,    KC_F,     KC_P,    KC_B,    KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, _______,
  _______, NAV_A,   KC_R,    KC_S,     KC_T,    KC_G,    KC_M,    KC_N,    KC_E,    KC_I,    NAV_O,   _______,
  _______, KC_Z,    KC_X,    KC_C,     KC_D,    KC_V,    KC_K,    KC_H,    KC_COMM, KC_DOT,  KC_SLSH, _______,
  _______, _______, _______, _______,  _______, _______, _______, _______, _______, _______, _______, _______
),

/*
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |   ⇥  |  qQ  |  hH< |  oO$ |  uU> |  xX  |  gG  |  cC[ |  rR_ |  fF] |  zZ  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc/^|  yY\ |  iI( |  eE" |  aA) |  .@# |  dD% |  sS{ |  tT= |  nN} |  bB| |;Ret/^|
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  -/⇧ |  jJ  |  /?: |  ,!* |  kK+ |  '`  |  wW  |  mM& |  lL^ |  pP~ |  vV  |  ;/⇧ |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Lower| Spc/^|  ⌥   |   ⌘  | Lower| Space|Space |Raise |Left/⌘| Down |  Up  |->/Rse|
 * `-----------------------------------------------------------------------------------'
 */
[_COLEMAK1] = LAYOUT_preonic_grid( \
  _______, KC_1,    KC_2,    KC_3,     KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    _______,
  _______, KC_Q,    KC_W,    KC_F,     KC_P,    KC_Z,    TD_JESC, KC_L,    KC_U,    KC_Y,    KC_SCLN, _______,
  _______, NAV_A,   KC_R,    KC_S,     KC_T,    KC_G,    KC_M,    KC_N,    KC_E,    KC_I,    NAV_O,   _______,
  _______, KC_X,    KC_C,    TD(CT_MV),KC_D,    KC_B,    KC_K,    KC_H,    KC_COMM, KC_DOT,  KC_SLSH, _______,
  _______, _______, _______, _______,  _______, _______, _______, _______, _______, _______, _______, _______
/*_______, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
  _______, KC_Q,    KC_H,    KC_O,    KC_U,    KC_X,    KC_G,    KC_C,    KC_R,    KC_F,    KC_Z,    _______,
  _______, KC_Y,    KC_I,    KC_E,    KC_A,    KC_DOT,  KC_D,    KC_S,    KC_T,    KC_N,    KC_B,    _______,
  _______, KC_J,    KC_SLSH, KC_COMM, KC_K,    KC_QUOT, KC_W,    KC_M,    KC_L,    KC_P,    KC_V,    _______,
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______ */
),
/* Colemak2: derived from Colemak Mod-DH, switching KM and rotating BGV
 * (just switch DV and HM w/r to Colemak proper)
 * in "wide" configuration
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |   Q  |   W  |   F  |   P  |   Z  |   \  |   `  |   J  |   L  |   U  |   Y  |  ;   |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | A/Nav|   R  |   S  |   T  |   G  |   -  |   '  |   M  |   N  |   E  |   I  | O/Nav|
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |   X  |   V  |   C  |   D  |   B  |   (  |   )  |   K  |   H  |   ,  |   .  |   /  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Lower| Spc/^|  ⌥   |   ⌘  | Lower| Space|Space |Ret/Rs|Left/⌘| Down |  Up  |->/Rse|
 * `-----------------------------------------------------------------------------------'
 */
[_COLEMAK2] = LAYOUT_preonic_grid( \
  KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
  KC_Q,    KC_W,    KC_F,    KC_P,    KC_Z,    KC_BSLS, KC_GRV,  KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN,
  NAV_A,   KC_R,    KC_S,    KC_T,    KC_G,    KC_MINS, KC_QUOT, KC_M,    KC_N,    KC_E,    KC_I,    NAV_O,
  KC_X,    KC_V,    KC_C,    KC_D,    KC_B,    KC_LPRN, KC_RPRN, KC_K,    KC_H,    KC_COMM, KC_DOT,  KC_SLSH,
  _______, _______, _______, GUI_ESC, LOW_SPC, LSF_TAB, RSF_BSP, RSE_RET, _______, _______, _______, _______
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |   ~  |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  |   (  |   )  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |   ~  |   !  |   @  |   #  |   $  |  ,   |   .  |   7  |   8  |   9  |   *  |  /   |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      | Bksp | LEFT |  UP  | DOWN | RIGHT|   %  |   4  |   5  |   6  |   +  |  -   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |  ^Z  |  ^X  |  ^C  |  ^V  |  [   |   ]  |   1  |   2  |   3  | Enter|  \   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      | Bksp |      |      |Shift | Bksp |Space | 0/Rse|   0  |   .  |   ,  |  `   |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_preonic_grid( \
  KC_TILD, KC_EXLM,   KC_AT,     KC_HASH,   KC_DLR,   KC_PERC, KC_CIRC, KC_AMPR,KC_ASTR,KC_LPRN,KC_RPRN, KC_BSPC,
  KC_TILD, KC_EXLM,   KC_AT,     KC_HASH,   KC_DLR,   KC_COMM, KC_DOT,  KC_7,   KC_8,   KC_9,   KC_ASTR, KC_SLSH,
  RAISE,   KC_BSPC,   KC_LEFT,   KC_UP,     KC_DOWN,  KC_RGHT, KC_PERC, KC_4,   KC_5,   KC_6,   KC_PLUS, KC_MINS,
  _______, C(KC_Z),   C(KC_X),   C(KC_C),   C(KC_V),  KC_LBRC, KC_RBRC, KC_1,   KC_2,   KC_3,   KC_ENT,  KC_BSLS,
  RAISE,   KC_BSPC,   _______,   _______,   KC_LSFT,  KC_BSPC, KC_SPC,  RSE_0,  KC_0,   KC_DOT, KC_COMM, KC_GRV
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |   `  |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  |   +  |   :  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc/^|   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |  '   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |   [  |   ]  |   -  |   =  |   (  |   )  |   '  |   ,  |   .  |   /  |  \   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Brite|      |      |      |      |             |      |      | Vol- | Vol+ |  `   |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = LAYOUT_preonic_grid( \
  KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSPC,
  KC_GRV,  KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, KC_PLUS, KC_COLN, _______,
  _______, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_QUOT,
  _______, KC_LBRC, KC_RBRC, KC_MINS, KC_EQL,  KC_LPRN, KC_RPRN, KC_QUOT, _______, _______, _______, KC_BSLS,
  BACKLIT, _______, _______, _______, LSF_BSP, _______, _______, _______, _______, KC_VOLD, KC_VOLU, KC_GRV
),

/* Directional navigation layer
 *
 *          Large movements -----/```````````````````\   /```````````````````\----- Vim-style arrow keys
 *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
 *                 │     │     │     │     │     │     │     │     │     │     │     │     │
 *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
 *                 │     │     │Home │PgUp │PgDn │ End │  ←  │  ↓  │  ↑  │  →  │     │     │
 *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
 *                 │     │     │ ⌘ ← │ ⌘ ↑ │ ⌘ ↓ │ ⌘ → │ ⌥ ← │ ⌥ ↓ │ ⌥ ↑ │ ⌥ → │     │     │
 *                 ├─────┼─────┼─────┼─────┼─────┼─────╆━━━━━╅─────┼─────┼─────┼─────┼─────┤
 *                 │     │     │     │     │     │     ┃ Del ┃     │     │Brit-│Brit+│     │
 *                 └─────┴─────┴─────┴─────┴─────┴─────┺━━━━━┹─────┴─────┴─────┴─────┴─────┘
 */
[_NAV] = LAYOUT_preonic_grid(
    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
    _______, XXXXXXX, KC_HOME, KC_PGUP, KC_PGDN, KC_END,  KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, XXXXXXX, _______,
    _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_BSPC, KC_LEFT, XXXXXXX, KC_VOLD, KC_VOLU, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_BRMD, KC_BRMU, _______
),


/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  |  F10 |  F11 |  F12 |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      | Reset|      |      |      |      |      |      |      |      |      |  Del |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |      |      |Aud on|AudOff|AGnorm|AGswap|Qwerty|Colemk|Colem1|Colem2|      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |Voice-|Voice+|Mus on|MusOff|MidiOn|MidOff|      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] = LAYOUT_preonic_grid( \
  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  \
  _______, RESET,   DEBUG,   _______, _______, _______, _______, TERM_ON, TERM_OFF,_______, _______, KC_DEL,  \
  _______, _______, MU_MOD,  AU_ON,   AU_OFF,  AG_NORM, AG_SWAP, QWERTY,  COLEMAK, COLEMAK1,COLEMAK2,_______, \
  _______, MUV_DE,  MUV_IN,  MU_ON,   MU_OFF,  MI_ON,   MI_OFF,  _______, _______, _______, _______, _______, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______  \
)


};

void dance_cln_finished (qk_tap_dance_state_t *state, void *user_data) {
  if (state->count == 1) {
    register_code (KC_RSFT);
    register_code (KC_SCLN);
  } else {
    register_code (KC_SCLN);
  }
}

void dance_cln_reset (qk_tap_dance_state_t *state, void *user_data) {
  if (state->count == 1) {
    unregister_code (KC_RSFT);
    unregister_code (KC_SCLN);
  } else {
    unregister_code (KC_SCLN);
  }
}

//All tap dance functions would go here. Only showing this one.
qk_tap_dance_action_t tap_dance_actions[] = {
    [CT_QE]    = ACTION_TAP_DANCE_DOUBLE (KC_ENT, KC_QUOT)
  , [CT_MV]    = ACTION_TAP_DANCE_DOUBLE (KC_V, KC_MINS)
  , [CT_ED]    = ACTION_TAP_DANCE_DOUBLE (KC_D, KC_EQL)
  , [CT_CLN]   = ACTION_TAP_DANCE_FN_ADVANCED (NULL, dance_cln_finished, dance_cln_reset)
  , [CT_DE]    = ACTION_TAP_DANCE_DOUBLE (KC_BSPC, KC_ESC)
  , [CT_GE]    = ACTION_TAP_DANCE_DOUBLE (KC_GRV, KC_ESC)
  , [CT_JESC]  = ACTION_TAP_DANCE_DOUBLE (KC_J, KC_ESC)
// Other declarations would go here, separated by commas, if you have them
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
        case QWERTY:
          if (record->event.pressed) {
            set_single_persistent_default_layer(_QWERTY);
          }
          return false;
          break;
        case COLEMAK:
          if (record->event.pressed) {
            set_single_persistent_default_layer(_COLEMAK);
          }
          return false;
          break;
        case COLEMAK1:
          if (record->event.pressed) {
            set_single_persistent_default_layer(_COLEMAK1);
          }
          return false;
          break;
        case COLEMAK2:
          if (record->event.pressed) {
            set_single_persistent_default_layer(_COLEMAK2);
          }
          return false;
          break;
        case LOWER:
          if (record->event.pressed) {
            layer_on(_LOWER);
            update_tri_layer(_LOWER, _RAISE, _ADJUST);
          } else {
            layer_off(_LOWER);
            update_tri_layer(_LOWER, _RAISE, _ADJUST);
          }
          return false;
          break;
        case RAISE:
          if (record->event.pressed) {
            layer_on(_RAISE);
            update_tri_layer(_LOWER, _RAISE, _ADJUST);
          } else {
            layer_off(_RAISE);
            update_tri_layer(_LOWER, _RAISE, _ADJUST);
          }
          return false;
          break;
        case BACKLIT:
          if (record->event.pressed) {
            register_code(KC_RSFT);
            #ifdef BACKLIGHT_ENABLE
              backlight_step();
            #endif
            #ifdef __AVR__
            PORTE &= ~(1<<6);
            #endif
          } else {
            unregister_code(KC_RSFT);
            #ifdef __AVR__
            PORTE |= (1<<6);
            #endif
          }
          return false;
          break;
      }
    return true;
};

bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

void encoder_update(bool clockwise) {
  if (muse_mode) {
    if (IS_LAYER_ON(_RAISE)) {
      if (clockwise) {
        muse_offset++;
      } else {
        muse_offset--;
      }
    } else {
      if (clockwise) {
        muse_tempo+=1;
      } else {
        muse_tempo-=1;
      }
    }
  } else {
    if (clockwise) {
      register_code(KC_PGDN);
      unregister_code(KC_PGDN);
    } else {
      register_code(KC_PGUP);
      unregister_code(KC_PGUP);
    }
  }
}

void dip_update(uint8_t index, bool active) {
  switch (index) {
    case 0:
      if (active) {
        layer_on(_ADJUST);
      } else {
        layer_off(_ADJUST);
      }
      break;
    case 1:
      if (active) {
        muse_mode = true;
      } else {
        muse_mode = false;
        #ifdef AUDIO_ENABLE
          stop_all_notes();
        #endif
      }
   }
}

void matrix_scan_user(void) {
  #ifdef AUDIO_ENABLE
    if (muse_mode) {
      if (muse_counter == 0) {
        uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
        if (muse_note != last_muse_note) {
          stop_note(compute_freq_for_midi_note(last_muse_note));
          play_note(compute_freq_for_midi_note(muse_note), 0xF);
          last_muse_note = muse_note;
        }
      }
      muse_counter = (muse_counter + 1) % muse_tempo;
    }
  #endif
}

bool music_mask_user(uint16_t keycode) {
  switch (keycode) {
    case RAISE:
    case LOWER:
      return false;
    default:
      return true;
  }
}

/* Copyright 2018 Noah Frederick
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
#include "my.h"
#include "my_dynamic_macro.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  /* Base layer (Qwerty)
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │  ⇥  │  Q  │  W  │  E  │  R  │  T  │  Y  │  U  │  I  │  O  │  P  │  '  │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *  Tap for Esc -- │  ⌃  │  A  │  S  │  D  │  F  │  G  │  H  │  J  │  K  │  L  │  ;  │  ⌃  │ -- Tap for Enter
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *    Tap for ( -- │  ⇧  │  Z  │  X  │  C  │  V  │  B  │  N  │  M  │  ,  │  .  │  /  │  ⇧  │ -- Tap for )
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *    Tap for [ -- │ GUI │Hyper│  ⌥  │  ⌘  │  ↓  │Space│ Nav │  ↑  │  ⌘  │  ⌥  │Hyper│ GUI │ -- Tap for ]
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   *                         /         Tap for Backspace __/                       /
   *    Tap for ] [ --------'-----------------------------------------------------'
   */
  [QWERTY_LAYER] = LAYOUT_planck_grid_wrapper(
    KC_TAB,  _________________QWERTY_L1_________________, _________________QWERTY_R1_________________, KC_QUOT,
    CTL_ESC, _________________QWERTY_L2_________________, _________________QWERTY_R2_________________, CTL_ENT,
    KC_LSPO, _________________QWERTY_L2_________________, _________________QWERTY_R3_________________, KC_RSPC,
    GUI_L,   HYPER_L, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  NAV_BSP, RAISE,   KC_RGUI, KC_RALT, HYPER_R, GUI_R
  ),

  /* Base layer (Colemak)
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │     │  Q  │  W  │  F  │  P  │  G  │  J  │  L  │  U  │  Y  │  ;  │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │  A  │  R  │  S  │  T  │  D  │  H  │  N  │  E  │  I  │  O  │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │  Z  │  X  │  C  │  V  │  B  │  K  │  M  │  ,  │  .  │  /  │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   */
  [COLEMAK_LAYER] = LAYOUT_planck_grid_wrapper(
    _______, _________________COLEMAK_L1________________, _________________COLEMAK_R1________________, _______,
    _______, _________________COLEMAK_L2________________, _________________COLEMAK_R2________________, _______,
    _______, _________________COLEMAK_L3________________, _________________COLEMAK_R3________________, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
  ),

  /* Stitching layer (camel)
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │Exit │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │ (⇧) │     │     │     │     │     │     │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   */
  [CAMEL_LAYER] = LAYOUT_planck_grid_wrapper(
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    STCH_EX, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, CAPITAL, _______, _______, _______, _______, _______, _______
  ),

  /* Stitching layer (kebab)
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │Exit │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │  -  │     │     │     │     │     │     │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   */
  [KEBAB_LAYER] = LAYOUT_planck_grid_wrapper(
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    STCH_EX, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, KC_MINS, _______, _______, _______, _______, _______, _______
  ),

  /* Stitching layer (snake)
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │Exit │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │     │     │     │     │     │     │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │  _  │     │     │     │     │     │     │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   */
  [SNAKE_LAYER] = LAYOUT_planck_grid_wrapper(
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    STCH_EX, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
    _______, _______, _______, _______, _______, KC_UNDS, _______, _______, _______, _______, _______, _______
  ),

  /* Numeric layer
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *  Application -- │ ⌘-` │ F1  │ F2  │ F3  │ F4  │ F5  │ F6  │ F7  │ F8  │ F9  │ F10 │  #  │
   *       window    ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *     switcher    │     │  1  │  2  │  3  │  4  │  5  │  6  │  7  │  8  │  9  │  0  │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │  -  │  =  │  `  │  \  │  :  │ndash│mdash│  ,  │  .  │  /  │     │
   *                 ├─────┼─────┼─────┼─────╆━━━━━╅─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │     │     │     ┃     ┃     │     │     │     │     │     │     │
   *                 └─────┴─────┴─────┴─────┺━━━━━┹─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   */
  [LOWER_LAYER] = LAYOUT_planck_grid_wrapper(
    GUI_GRV, _________________LOWER_L1__________________, _________________LOWER_R1__________________, KC_HASH,
    _______, _________________LOWER_L2__________________, _________________LOWER_R2__________________, _______,
    _______, _________________LOWER_L3__________________, _________________LOWER_R3__________________, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
  ),

  /* Symbol layer
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │     │ F11 │ F12 │ F13 │ F14 │ F15 │ F16 │ F17 │ F18 │ F19 │ F20 │  #  │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │  !  │  @  │  #  │  $  │  %  │  ^  │  &  │  *  │  {  │  }  │     │ \
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤  |-- Mostly shifted version
   *                 │     │  _  │  +  │  ~  │  |  │  :  │ndash│mdash│  ,  │  .  │  /  │     │ /    of lower layer
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────╆━━━━━╅─────┼─────┼─────┼─────┤
   *                 │     │     │     │     │     │  Delete   ┃     ┃     │     │     │     │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┺━━━━━┹─────┴─────┴─────┴─────┘
   */
  [RAISE_LAYER] = LAYOUT_planck_grid_wrapper(
    _______, _________________RAISE_L1__________________, _________________RAISE_R1__________________, KC_HASH,
    _______, _________________RAISE_L2__________________, _________________RAISE_R2__________________, _______,
    _______, _________________RAISE_L3__________________, _________________RAISE_R3__________________, _______,
    _______, _______, _______, _______, _______, KC_DEL,  KC_DEL,  _______, _______, _______, _______, _______
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
   *                 │     │     │     │     │     │Lead ┃     ┃     │     │     │     │     │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┺━━━━━┹─────┴─────┴─────┴─────┴─────┘
   */
  [NAV_LAYER] = LAYOUT_planck_grid_wrapper(
    XXXXXXX, __________________NAV_L1___________________, __________________NAV_R1___________________, XXXXXXX,
    _______, __________________NAV_L2___________________, __________________NAV_R2___________________, _______,
    _______, __________________NAV_L3___________________, __________________NAV_R3___________________, _______,
    _______, _______, _______, _______, XXXXXXX, LEADER,  NAV_BSP, XXXXXXX, _______, _______, _______, _______
  ),

  /* GUI (window management/mouse/media controls) layer
   *
   *         Mouse keys -----/```````````````````\               /```````````````````\----- Window manager
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │     │Ms B2│Ms Up│Ms B1│Ms WD│     │     │Prev │ NW  │  N  │ NE  │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │Ms L │Ms Dn│Ms R │Ms WU│     │     │Full │  W  │Centr│  E  │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │     │Undo │ Cut │Copy │Paste│     │     │Next │ SW  │  S  │ SE  │     │
   *                 ┢━━━━━╅─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────╆━━━━━┪
   *                 ┃     ┃Prev │Play │Next │Brig-│Sleep│Wake │Brig+│Mute │Vol- │Vol+ ┃     ┃
   *                 ┗━━━━━┹─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┺━━━━━┛
   *                         \___ Media ___/   \___ Screen/sleep __/   \___ Volume __/
   */
  [GUI_LAYER] = LAYOUT_planck_grid_wrapper(
    _______, __________________GUI_L1___________________, __________________GUI_R1___________________, _______,
    _______, __________________GUI_L2___________________, __________________GUI_R2___________________, _______,
    _______, __________________GUI_L3___________________, __________________GUI_R3___________________, _______,
    _______, __________MEDIA__________, KC_SLCK, KC_SLEP, KC_WAKE, KC_PAUS, __________VOLUME_________, _______
  ),

  /* Stenography layer
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *                 │  ⇥  │  #  │  #  │  #  │  #  │  #  │  #  │  #  │  #  │  #  │  #  │  #  │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │Res 1│     │  T  │  P  │  H  │     ┆     │  F  │  P  │  L  │  T  │  D  │
   *                 ├─────┼╌ S ╌┼─────┼─────┼─────┼╌╌╌╌ * ╌╌╌╌┼─────┼─────┼─────┼─────┼─────┤
   *                 │Res 2│     │  K  │  W  │  R  │     ┆     │  R  │  B  │  G  │  S  │  Z  │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *                 │Exit │     │  ⌥  │  ⌘  │  A  │  O  │  E  │  U  │  ⌘  │  ⌥  │ Pwr │ FN  │
   *                 └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
   */
  [STENO_LAYER] = LAYOUT_planck_grid_wrapper(
    KC_TAB,  _________________STENO_L1__________________, _________________STENO_R1___________________________,
    STN_RES1,_________________STENO_L2__________________, _________________STENO_R2___________________________,
    STN_RES2,_________________STENO_L3__________________, _________________STENO_R3___________________________,
    STN_EXIT,XXXXXXX, KC_LALT, KC_LGUI, ____STENO_AO____, ____STENO_EU____, KC_RGUI, KC_RALT, STN_PWR, STN_FN
  ),

  /* Keyboard settings layer
   *                 ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
   *     Firmware -- │     │Reset│Make │     │     │     │     │     │     │     │Vers │     │
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *          RGB -- │Qwert│     │     │Mode-│Mode+│Hue -│Hue +│Sat -│Sat +│     │Play1│Rec 1│ -- Record/play macro 1
   *                 ├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
   *        Audio -- │Colem│Voic-│Voic+│Mus +│Mus -│MIDI+│MIDI-│Aud +│Aud -│     │Play2│Rec 2│ -- Record/play macro 2
   *                 ├─────┼─────┼─────┼─────╆━━━━━╅─────┼─────╆━━━━━╅─────┼─────┼─────┼─────┤
   *                 │Steno│     │Swap │Norm ┃     ┃  Toggle   ┃     ┃Toggl│Brig-│Brig+│Stop │ -- Stop recording macro
   *                 └─────┴─────┴─────┴─────┺━━━━━┹─────┴─────┺━━━━━┹─────┴─────┴─────┴─────┘
   *                Swap GUI/Alt _/________/             \_____________\_ Backlight _/
   */
  [ADJUST_LAYER] = LAYOUT_planck_grid_wrapper(
    XXXXXXX, RESET,   SEND_MAKE, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, SEND_VERSION,    XXXXXXX,
    QWERTY,  XXXXXXX, XXXXXXX,   RGB_RMOD, RGB_MOD, RGB_HUD, RGB_HUI, RGB_SAD, RGB_SAI, XXXXXXX, DYN_MACRO_PLAY1, DYN_REC_START1,
    COLEMAK, MUV_DE,  MUV_IN,    MU_ON,    MU_OFF,  MI_ON,   MI_OFF,  AU_ON,   AU_OFF,  XXXXXXX, DYN_MACRO_PLAY2, DYN_REC_START2,
    STENO,   XXXXXXX, AG_SWAP,   AG_NORM,  LOWER,   LIT_TOG, LIT_TOG, RAISE,   LIT_TOG, LIT_DEC, LIT_INC,         DYN_REC_STOP
  )
};

#ifdef RGB_MATRIX_ENABLE
void rgb_matrix_indicators_user(void) {
  switch (biton32(layer_state)) {
    case LOWER_LAYER:
      rgb_matrix_set_color(40, 0xFF, 0xFF, 0xFF); // LOWER
      break;
    case RAISE_LAYER:
      rgb_matrix_set_color(44, 0xFF, 0xFF, 0xFF); // RAISE
      break;
    case NAV_LAYER:
      rgb_matrix_set_color(43, 0xFF, 0xFF, 0xFF); // NAV_BSP
      break;
    case GUI_LAYER:
      rgb_matrix_set_color(36, 0xFF, 0xFF, 0xFF); // GUI_L
      rgb_matrix_set_color(48, 0xFF, 0xFF, 0xFF); // GUI_R
      break;
    case STENO_LAYER:
      rgb_matrix_set_color(36, 0xFF, 0x30, 0x00); // STN_EXIT

      // Mask out everything but alphabetic steno keys.
      rgb_matrix_set_color(0, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(1, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(2, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(3, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(4, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(5, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(6, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(7, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(8, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(9, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(10, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(11, 0x00, 0x00, 0x00);

      rgb_matrix_set_color(12, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(17, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(18, 0x00, 0x00, 0x00);

      rgb_matrix_set_color(24, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(29, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(30, 0x00, 0x00, 0x00);

      rgb_matrix_set_color(37, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(38, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(39, 0x00, 0x00, 0x00);

      rgb_matrix_set_color(45, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(46, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(47, 0x00, 0x00, 0x00);
      rgb_matrix_set_color(48, 0x00, 0x00, 0x00);
      break;
    case ADJUST_LAYER:
      rgb_matrix_set_color(40, 0xFF, 0xFF, 0xFF); // LOWER
      rgb_matrix_set_color(44, 0xFF, 0xFF, 0xFF); // RAISE
      break;
    case CAMEL_LAYER:
    case KEBAB_LAYER:
    case SNAKE_LAYER:
      rgb_matrix_set_color(12, 0xFF, 0x30, 0x00); // STCH_EX
      rgb_matrix_set_color(41, 0x88, 0xFF, 0x00); // "Space bar"
      break;
  }

  // Disable middle LED between keys in grid layout.
  rgb_matrix_set_color(42, 0x00, 0x00, 0x00);
}
#endif
/* Copyright 2018 Noah Frederick
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

#pragma once

#include "quantum.h"
#include "version.h"
#include "keymap_steno.h"

#ifdef RGB_MATRIX_ENABLE
#include "rgb_matrix.h"
#endif

enum user_layers {
  QWERTY_LAYER,
  COLEMAK_LAYER,
  CAMEL_LAYER,
  KEBAB_LAYER,
  SNAKE_LAYER,
  LOWER_LAYER,
  RAISE_LAYER,
  NAV_LAYER,
  GUI_LAYER,
  STENO_LAYER,
  ADJUST_LAYER
};

enum user_keycodes {
  LEADER = SAFE_RANGE,
  QWERTY,
  COLEMAK,
  STCH_EX,
  STENO,
  STN_EXIT,
  SEND_MAKE,
  SEND_VERSION,
  DYNAMIC_MACRO_RANGE
};

// Dynamic macros add additional keycodes.
#define NEW_SAFE_RANGE (DYNAMIC_MACRO_PLAY2 + 1)

#define LOWER MO(LOWER_LAYER)
#define RAISE MO(RAISE_LAYER)

#define GUI_L LT(GUI_LAYER, KC_LBRC)
#define GUI_R LT(GUI_LAYER, KC_RBRC)

#define HYPER_L ALL_T(KC_RBRC)
#define HYPER_R ALL_T(KC_LBRC)

#define CTL_ESC CTL_T(KC_ESC)
#define CTL_ENT CTL_T(KC_ENT)

#define CAPITAL OSM(MOD_LSFT)

#define NAV_BSP LT(NAV_LAYER, KC_BSPC)

#define GUI_GRV LGUI(KC_GRV)

// Dashes (macOS)
#define KC_NDSH LALT(KC_MINS)
#define KC_MDSH S(LALT(KC_MINS))

// Window manager keys
#define WM_FULL LALT(LGUI(KC_F))
#define WM_NEXT LCTL(LALT(LGUI(KC_RGHT)))
#define WM_PREV LCTL(LALT(LGUI(KC_LEFT)))
#define WM_NW   LCTL(LGUI(KC_LEFT))
#define WM_N    LALT(LGUI(KC_UP))
#define WM_NE   LCTL(LGUI(KC_RGHT))
#define WM_E    LALT(LGUI(KC_RGHT))
#define WM_SE   S(LCTL(LGUI(KC_RGHT)))
#define WM_S    LALT(LGUI(KC_DOWN))
#define WM_SW   S(LCTL(LGUI(KC_LEFT)))
#define WM_W    LALT(LGUI(KC_LEFT))
#define WM_CNTR LALT(LGUI(KC_C))

// Unify backlight controls
#ifdef RGB_MATRIX_ENABLE
#define LIT_TOG RGB_TOG
#define LIT_DEC RGB_VAD
#define LIT_INC RGB_VAI
#else
#define LIT_TOG BL_TOGG
#define LIT_DEC BL_DEC
#define LIT_INC BL_INC
#endif

// Alias layout macros that expand groups of keys.
#define LAYOUT_planck_grid_wrapper(...) LAYOUT_planck_grid(__VA_ARGS__)
#define LAYOUT_preonic_grid_wrapper(...) LAYOUT_preonic_grid(__VA_ARGS__)

#define _________________QWERTY_L1_________________ KC_Q,    KC_W,    KC_E,    KC_R,    KC_T
#define _________________QWERTY_L2_________________ KC_A,    KC_S,    KC_D,    KC_F,    KC_G
#define _________________QWERTY_L3_________________ KC_Z,    KC_X,    KC_C,    KC_V,    KC_B

#define _________________QWERTY_R1_________________ KC_Y,    KC_U,    KC_I,    KC_O,    KC_P
#define _________________QWERTY_R2_________________ KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN
#define _________________QWERTY_R3_________________ KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH

#define _________________COLEMAK_L1________________ KC_Q,    KC_W,    KC_F,    KC_P,    KC_G
#define _________________COLEMAK_L2________________ KC_A,    KC_R,    KC_S,    KC_T,    KC_D
#define _________________COLEMAK_L3________________ KC_Z,    KC_X,    KC_C,    KC_V,    KC_B

#define _________________COLEMAK_R1________________ KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN
#define _________________COLEMAK_R2________________ KC_H,    KC_N,    KC_E,    KC_I,    KC_O
#define _________________COLEMAK_R3________________ KC_K,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH

#define _________________LOWER_L1__________________ KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5
#define _________________LOWER_L2__________________ KC_1,    KC_2,    KC_3,    KC_4,    KC_5
#define _________________LOWER_L3__________________ KC_MINS, KC_EQL,  KC_GRV,  KC_BSLS, KC_COLN

#define _________________LOWER_R1__________________ KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10
#define _________________LOWER_R2__________________ KC_6,    KC_7,    KC_8,    KC_9,    KC_0
#define _________________LOWER_R3__________________ KC_NDSH, KC_MDSH, KC_COMM, KC_DOT,  KC_SLSH

#define _________________RAISE_L1__________________ KC_F11,  KC_F12,  KC_F13,  KC_F14,  KC_F15
#define _________________RAISE_L2__________________ KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC
#define _________________RAISE_L3__________________ KC_UNDS, KC_PLUS, KC_TILD, KC_PIPE, KC_COLN

#define _________________RAISE_R1__________________ KC_F16,  KC_F17,  KC_F18,  KC_F19,  KC_F20
#define _________________RAISE_R2__________________ KC_CIRC, KC_AMPR, KC_ASTR, KC_LCBR, KC_RCBR
#define _________________RAISE_R3__________________ KC_NDSH, KC_MDSH, KC_COMM, KC_DOT,  KC_SLSH

#define __________________NAV_L1___________________ XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX
#define __________________NAV_L2___________________ XXXXXXX, KC_HOME, KC_PGUP, KC_PGDN, KC_END
#define __________________NAV_L3___________________ XXXXXXX, LGUI(KC_LEFT), LGUI(KC_UP), LGUI(KC_DOWN), LGUI(KC_RGHT)

#define __________________NAV_R1___________________ XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX
#define __________________NAV_R2___________________ KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, XXXXXXX
#define __________________NAV_R3___________________ LALT(KC_LEFT), LALT(KC_DOWN), LALT(KC_UP), LALT(KC_RGHT), XXXXXXX

#define __________________GUI_L1___________________ KC_BTN2, KC_MS_U, KC_BTN1, KC_WH_D, XXXXXXX
#define __________________GUI_L2___________________ KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_U, XXXXXXX
#define __________________GUI_L3___________________ KC_UNDO, KC_CUT,  KC_COPY, KC_PSTE, XXXXXXX

#define __________________GUI_R1___________________ XXXXXXX, WM_PREV, WM_NW,   WM_N,    WM_NE
#define __________________GUI_R2___________________ XXXXXXX, WM_FULL, WM_W,    WM_CNTR, WM_E
#define __________________GUI_R3___________________ XXXXXXX, WM_NEXT, WM_SW,   WM_S,    WM_SE

#define _________________STENO_L1__________________ STN_N2,  STN_N3,  STN_N4,  STN_N5,  STN_N6
#define _________________STENO_L2__________________ STN_S1,  STN_TL,  STN_PL,  STN_HL,  STN_ST1
#define _________________STENO_L3__________________ STN_S2,  STN_KL,  STN_WL,  STN_RL,  STN_ST2

#define _________________STENO_R1___________________________ STN_N7,  STN_N8,  STN_N9,  STN_NA,  STN_NB,  STN_NC
#define _________________STENO_R2___________________________ STN_ST3, STN_FR,  STN_PR,  STN_LR,  STN_TR,  STN_DR
#define _________________STENO_R3___________________________ STN_ST4, STN_RR,  STN_BR,  STN_GR,  STN_SR,  STN_ZR

#define ____STENO_AO____ STN_A, STN_O
#define ____STENO_EU____ STN_E, STN_U

#define __________VOLUME_________ KC_MUTE, KC_VOLD, KC_VOLU
#define __________MEDIA__________ KC_MPRV, KC_MPLY, KC_MNXT

#define __________________BASE_L0__________________ _________________LOWER_L1__________________
#define __________________BASE_R0__________________ _________________LOWER_R1__________________

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110614173122) do

  create_table "combinations", :force => true do |t|
    t.integer "n1"
    t.integer "n2"
    t.integer "n3"
    t.integer "n4"
    t.integer "n5"
    t.integer "sum"
    t.integer "no_of_even"
    t.integer "no_of_odd"
    t.integer "no_end_0"
    t.integer "no_end_1"
    t.integer "no_end_2"
    t.integer "no_end_3"
    t.integer "no_end_4"
    t.integer "no_end_5"
    t.integer "no_end_6"
    t.integer "no_end_7"
    t.integer "no_end_8"
    t.integer "no_end_9"
    t.integer "d2"
    t.integer "d3"
    t.integer "d4"
    t.integer "d5"
    t.integer "d6"
    t.integer "d7"
    t.integer "d8"
    t.integer "d9"
    t.integer "set_prime"
    t.integer "set_1_21"
    t.integer "set_22_42"
    t.integer "set_1_7"
    t.integer "set_8_14"
    t.integer "set_15_21"
    t.integer "set_22_28"
    t.integer "set_29_36"
    t.integer "set_37_42"
    t.integer "set_up"
    t.integer "set_down"
    t.integer "set_left"
    t.integer "set_right"
    t.integer "set_1_9"
    t.integer "set_10_19"
    t.integer "set_20_29"
    t.integer "set_30_39"
    t.integer "set_40_42"
    t.integer "set_a"
    t.integer "set_b"
    t.integer "set_c"
    t.integer "set_d"
    t.integer "set_s"
    t.integer "set_t"
    t.integer "set_u"
    t.integer "set_w"
    t.integer "set_x"
    t.integer "set_y"
    t.integer "set_z"
    t.integer "set_1_14"
    t.integer "set_15_28"
    t.integer "set_29_42"
  end

  create_table "most_breaks", :force => true do |t|
    t.integer  "m1"
    t.integer  "m2"
    t.integer  "m3"
    t.integer  "m4"
    t.integer  "m5"
    t.integer  "m6"
    t.integer  "m7"
    t.integer  "m8"
    t.integer  "m9"
    t.integer  "m10"
    t.integer  "m11"
    t.integer  "m12"
    t.integer  "m13"
    t.integer  "m14"
    t.integer  "m15"
    t.integer  "m16"
    t.integer  "m17"
    t.integer  "m18"
    t.integer  "m19"
    t.integer  "m20"
    t.integer  "m21"
    t.integer  "m22"
    t.integer  "m23"
    t.integer  "m24"
    t.integer  "m25"
    t.integer  "m26"
    t.integer  "m27"
    t.integer  "m28"
    t.integer  "m29"
    t.integer  "m30"
    t.integer  "m31"
    t.integer  "m32"
    t.integer  "m33"
    t.integer  "m34"
    t.integer  "m35"
    t.integer  "m36"
    t.integer  "m37"
    t.integer  "m38"
    t.integer  "m39"
    t.integer  "m40"
    t.integer  "m41"
    t.integer  "m42"
    t.integer  "sum_m1"
    t.integer  "sum_m2"
    t.integer  "sum_m3"
    t.integer  "sum_m4"
    t.integer  "sum_m5"
    t.integer  "sum_m6"
    t.integer  "sum_m7"
    t.integer  "sum_m8"
    t.integer  "sum_m9"
    t.integer  "sum_m10"
    t.integer  "sum_m11"
    t.integer  "sum_m12"
    t.integer  "sum_m13"
    t.integer  "sum_m14"
    t.integer  "sum_m15"
    t.integer  "sum_m16"
    t.integer  "sum_m17"
    t.integer  "sum_m18"
    t.integer  "sum_m19"
    t.integer  "sum_m20"
    t.integer  "sum_m21"
    t.integer  "sum_m22"
    t.integer  "sum_m23"
    t.integer  "sum_m24"
    t.integer  "sum_m25"
    t.integer  "sum_m26"
    t.integer  "sum_m27"
    t.integer  "sum_m28"
    t.integer  "sum_m29"
    t.integer  "sum_m30"
    t.integer  "sum_m31"
    t.integer  "sum_m32"
    t.integer  "sum_m33"
    t.integer  "sum_m34"
    t.integer  "sum_m35"
    t.integer  "sum_m36"
    t.integer  "sum_m37"
    t.integer  "sum_m38"
    t.integer  "sum_m39"
    t.integer  "sum_m40"
    t.integer  "sum_m41"
    t.integer  "sum_m42"
    t.integer  "result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "most_oftens", :force => true do |t|
    t.integer "m1"
    t.integer "m2"
    t.integer "m3"
    t.integer "m4"
    t.integer "m5"
    t.integer "m6"
    t.integer "m7"
    t.integer "m8"
    t.integer "m9"
    t.integer "m10"
    t.integer "m11"
    t.integer "m12"
    t.integer "m13"
    t.integer "m14"
    t.integer "m15"
    t.integer "m16"
    t.integer "m17"
    t.integer "m18"
    t.integer "m19"
    t.integer "m20"
    t.integer "m21"
    t.integer "m22"
    t.integer "m23"
    t.integer "m24"
    t.integer "m25"
    t.integer "m26"
    t.integer "m27"
    t.integer "m28"
    t.integer "m29"
    t.integer "m30"
    t.integer "m31"
    t.integer "m32"
    t.integer "m33"
    t.integer "m34"
    t.integer "m35"
    t.integer "m36"
    t.integer "m37"
    t.integer "m38"
    t.integer "m39"
    t.integer "m40"
    t.integer "m41"
    t.integer "m42"
    t.integer "sum_m1"
    t.integer "sum_m2"
    t.integer "sum_m3"
    t.integer "sum_m4"
    t.integer "sum_m5"
    t.integer "sum_m6"
    t.integer "sum_m7"
    t.integer "sum_m8"
    t.integer "sum_m9"
    t.integer "sum_m10"
    t.integer "sum_m11"
    t.integer "sum_m12"
    t.integer "sum_m13"
    t.integer "sum_m14"
    t.integer "sum_m15"
    t.integer "sum_m16"
    t.integer "sum_m17"
    t.integer "sum_m18"
    t.integer "sum_m19"
    t.integer "sum_m20"
    t.integer "sum_m21"
    t.integer "sum_m22"
    t.integer "sum_m23"
    t.integer "sum_m24"
    t.integer "sum_m25"
    t.integer "sum_m26"
    t.integer "sum_m27"
    t.integer "sum_m28"
    t.integer "sum_m29"
    t.integer "sum_m30"
    t.integer "sum_m31"
    t.integer "sum_m32"
    t.integer "sum_m33"
    t.integer "sum_m34"
    t.integer "sum_m35"
    t.integer "sum_m36"
    t.integer "sum_m37"
    t.integer "sum_m38"
    t.integer "sum_m39"
    t.integer "sum_m40"
    t.integer "sum_m41"
    t.integer "sum_m42"
    t.integer "result_id"
  end

  create_table "rares", :force => true do |t|
    t.integer "r1"
    t.integer "r2"
    t.integer "r3"
    t.integer "r4"
    t.integer "r5"
    t.integer "r6"
    t.integer "r7"
    t.integer "r8"
    t.integer "r9"
    t.integer "r10"
    t.integer "r11"
    t.integer "r12"
    t.integer "r13"
    t.integer "r14"
    t.integer "r15"
    t.integer "r16"
    t.integer "r17"
    t.integer "r18"
    t.integer "r19"
    t.integer "r20"
    t.integer "r21"
    t.integer "r22"
    t.integer "r23"
    t.integer "r24"
    t.integer "r25"
    t.integer "r26"
    t.integer "r27"
    t.integer "r28"
    t.integer "r29"
    t.integer "r30"
    t.integer "r31"
    t.integer "r32"
    t.integer "r33"
    t.integer "r34"
    t.integer "r35"
    t.integer "r36"
    t.integer "r37"
    t.integer "r38"
    t.integer "r39"
    t.integer "r40"
    t.integer "r41"
    t.integer "r42"
    t.integer "sum_r1"
    t.integer "sum_r2"
    t.integer "sum_r3"
    t.integer "sum_r4"
    t.integer "sum_r5"
    t.integer "sum_r6"
    t.integer "sum_r7"
    t.integer "sum_r8"
    t.integer "sum_r9"
    t.integer "sum_r10"
    t.integer "sum_r11"
    t.integer "sum_r12"
    t.integer "sum_r13"
    t.integer "sum_r14"
    t.integer "sum_r15"
    t.integer "sum_r16"
    t.integer "sum_r17"
    t.integer "sum_r18"
    t.integer "sum_r19"
    t.integer "sum_r20"
    t.integer "sum_r21"
    t.integer "sum_r22"
    t.integer "sum_r23"
    t.integer "sum_r24"
    t.integer "sum_r25"
    t.integer "sum_r26"
    t.integer "sum_r27"
    t.integer "sum_r28"
    t.integer "sum_r29"
    t.integer "sum_r30"
    t.integer "sum_r31"
    t.integer "sum_r32"
    t.integer "sum_r33"
    t.integer "sum_r34"
    t.integer "sum_r35"
    t.integer "sum_r36"
    t.integer "sum_r37"
    t.integer "sum_r38"
    t.integer "sum_r39"
    t.integer "sum_r40"
    t.integer "sum_r41"
    t.integer "sum_r42"
    t.integer "result_id"
  end

  create_table "results", :force => true do |t|
    t.integer "no"
    t.integer "n1"
    t.integer "n2"
    t.integer "n3"
    t.integer "n4"
    t.integer "n5"
    t.integer "sum"
    t.integer "no_of_even"
    t.integer "no_of_odd"
    t.integer "no_end_0"
    t.integer "no_end_1"
    t.integer "no_end_2"
    t.integer "no_end_3"
    t.integer "no_end_4"
    t.integer "no_end_5"
    t.integer "no_end_6"
    t.integer "no_end_7"
    t.integer "no_end_8"
    t.integer "no_end_9"
    t.integer "d2"
    t.integer "d3"
    t.integer "d4"
    t.integer "d5"
    t.integer "d6"
    t.integer "d7"
    t.integer "d8"
    t.integer "d9"
    t.integer "set_prime"
    t.integer "set_1_21"
    t.integer "set_22_42"
    t.integer "set_1_7"
    t.integer "set_8_14"
    t.integer "set_15_21"
    t.integer "set_22_28"
    t.integer "set_29_36"
    t.integer "set_37_42"
    t.integer "set_up"
    t.integer "set_down"
    t.integer "set_left"
    t.integer "set_right"
    t.integer "set_1_9"
    t.integer "set_10_19"
    t.integer "set_20_29"
    t.integer "set_30_39"
    t.integer "set_40_42"
    t.date    "date"
    t.integer "combination_id"
    t.integer "set_a"
    t.integer "set_b"
    t.integer "set_c"
    t.integer "set_d"
    t.integer "set_s"
    t.integer "set_t"
    t.integer "set_u"
    t.integer "set_w"
    t.integer "set_x"
    t.integer "set_y"
    t.integer "set_z"
    t.integer "set_1_14"
    t.integer "set_15_28"
    t.integer "set_29_42"
  end

end

# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141019141940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "backups", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "barrios", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ciudads", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discos", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipos", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_perrele", force: true do |t|
    t.integer "material_id"
    t.integer "perrele_id"
  end

  add_index "material_perrele", ["material_id"], name: "index_material_perrele_on_material_id", using: :btree
  add_index "material_perrele", ["perrele_id"], name: "index_material_perrele_on_perrele_id", using: :btree

  create_table "material_tagtemas", force: true do |t|
    t.integer "material_id"
    t.integer "tagtemas_id"
  end

  add_index "material_tagtemas", ["material_id"], name: "index_material_tagtemas_on_material_id", using: :btree
  add_index "material_tagtemas", ["tagtemas_id"], name: "index_material_tagtemas_on_tagtemas_id", using: :btree

  create_table "materials", force: true do |t|
    t.integer  "client_id"
    t.integer  "prod_id"
    t.text     "titulo"
    t.integer  "tipo_id"
    t.text     "descri"
    t.integer  "ciudad_id"
    t.integer  "barrio_id"
    t.date     "fecha_desde"
    t.date     "fecha_hasta"
    t.text     "discurso"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "materials", ["barrio_id"], name: "index_materials_on_barrio_id", using: :btree
  add_index "materials", ["ciudad_id"], name: "index_materials_on_ciudad_id", using: :btree
  add_index "materials", ["client_id"], name: "index_materials_on_client_id", using: :btree
  add_index "materials", ["prod_id"], name: "index_materials_on_prod_id", using: :btree
  add_index "materials", ["tipo_id"], name: "index_materials_on_tipo_id", using: :btree

  create_table "perreles", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prods", force: true do |t|
    t.text     "descri"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ruta", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storage_infos", force: true do |t|
    t.integer  "equipo_id"
    t.integer  "disco_id"
    t.integer  "ruta_id"
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tagtemas", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos", force: true do |t|
    t.text     "descri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

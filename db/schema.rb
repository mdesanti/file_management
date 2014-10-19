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

ActiveRecord::Schema.define(version: 20141015123627) do

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

  create_table "material_crudo_perrele", force: true do |t|
    t.integer "material_crudo_id"
    t.integer "perrele_id"
  end

  add_index "material_crudo_perrele", ["material_crudo_id"], name: "index_material_crudo_perrele_on_material_crudo_id", using: :btree
  add_index "material_crudo_perrele", ["perrele_id"], name: "index_material_crudo_perrele_on_perrele_id", using: :btree

  create_table "material_crudo_tagtemas", force: true do |t|
    t.integer "material_crudo_id"
    t.integer "tagtemas_id"
  end

  add_index "material_crudo_tagtemas", ["material_crudo_id"], name: "index_material_crudo_tagtemas_on_material_crudo_id", using: :btree
  add_index "material_crudo_tagtemas", ["tagtemas_id"], name: "index_material_crudo_tagtemas_on_tagtemas_id", using: :btree

  create_table "material_crudos", force: true do |t|
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
    t.integer  "equipo_id"
    t.integer  "disco_id"
    t.integer  "ruta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "material_crudos", ["barrio_id"], name: "index_material_crudos_on_barrio_id", using: :btree
  add_index "material_crudos", ["ciudad_id"], name: "index_material_crudos_on_ciudad_id", using: :btree
  add_index "material_crudos", ["client_id"], name: "index_material_crudos_on_client_id", using: :btree
  add_index "material_crudos", ["disco_id"], name: "index_material_crudos_on_disco_id", using: :btree
  add_index "material_crudos", ["equipo_id"], name: "index_material_crudos_on_equipo_id", using: :btree
  add_index "material_crudos", ["prod_id"], name: "index_material_crudos_on_prod_id", using: :btree
  add_index "material_crudos", ["ruta_id"], name: "index_material_crudos_on_ruta_id", using: :btree
  add_index "material_crudos", ["tipo_id"], name: "index_material_crudos_on_tipo_id", using: :btree

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

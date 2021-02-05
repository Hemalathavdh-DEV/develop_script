# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_05_022742) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ilance_buynow_orders", primary_key: "orderid", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "parentid", default: 0, null: false
    t.integer "project_id", default: 0, null: false
    t.integer "buyer_id", default: 0, null: false
    t.integer "owner_id", default: 0, null: false
    t.integer "invoiceid", default: 0, null: false
    t.integer "attachid", default: 0, null: false
    t.integer "qty", default: 1, null: false
    t.float "amount", limit: 53, default: 0.0, null: false
    t.float "salestax", limit: 53, default: 0.0, null: false
    t.string "salestaxstate", limit: 250, default: "", null: false
    t.string "salestaxrate", limit: 10, default: "0", null: false
    t.integer "salestaxshipping", default: 0, null: false
    t.float "escrowfee", limit: 53, default: 0.0, null: false
    t.float "escrowfeebuyer", limit: 53, default: 0.0, null: false
    t.float "fvf", limit: 53, default: 0.0, null: false
    t.float "fvfbuyer", limit: 53, default: 0.0, null: false
    t.integer "isescrowfeepaid", default: 0, null: false
    t.integer "isescrowfeebuyerpaid", default: 0, null: false
    t.integer "isfvfpaid", default: 0, null: false
    t.integer "isfvfbuyerpaid", default: 0, null: false
    t.integer "escrowfeeinvoiceid", default: 0, null: false
    t.integer "escrowfeebuyerinvoiceid", default: 0, null: false
    t.integer "fvfinvoiceid", default: 0, null: false
    t.integer "fvfbuyerinvoiceid", default: 0, null: false
    t.integer "ship_required", default: 1, null: false
    t.text "ship_location", size: :medium
    t.datetime "orderdate", null: false
    t.datetime "canceldate", null: false
    t.datetime "arrivedate", null: false
    t.datetime "paiddate", null: false
    t.datetime "releasedate", null: false
    t.integer "winnermarkedaspaid", default: 0, null: false
    t.datetime "winnermarkedaspaiddate", null: false
    t.text "winnermarkedaspaidmethod", size: :medium
    t.string "buyerpaymethod", limit: 250, default: "", null: false
    t.float "buyershipcost", limit: 53, default: 0.0, null: false
    t.integer "buyershipperid", default: 0, null: false
    t.integer "sellermarkedasshipped", default: 0, null: false
    t.datetime "sellermarkedasshippeddate", null: false
    t.string "shiptracknumber", limit: 250, default: "", null: false
    t.integer "buyerfeedback", default: 0, null: false
    t.integer "sellerfeedback", default: 0, null: false
    t.column "status", "enum('paid','cancelled','pending_delivery','delivered','fraud','offline','offline_delivered')", default: "paid", null: false
    t.index ["attachid"], name: "attachid"
    t.index ["buyer_id"], name: "buyer_id"
    t.index ["invoiceid"], name: "invoiceid"
    t.index ["owner_id"], name: "owner_id"
    t.index ["parentid"], name: "parentid"
    t.index ["project_id"], name: "project_id"
    t.index ["status"], name: "status"
  end

  create_table "ilance_projects", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id", default: 0, null: false
    t.integer "escrow_id", default: 0, null: false
    t.integer "cid", default: 0, null: false
    t.text "description", size: :medium
    t.column "ishtml", "enum('0','1')", default: "0", null: false
    t.text "description_videourl", size: :medium
    t.datetime "date_added", null: false
    t.datetime "date_starts", null: false
    t.datetime "date_end", null: false
    t.integer "gtc", default: 0, null: false
    t.datetime "gtc_cancelled", null: false
    t.integer "user_id", default: 0, null: false
    t.integer "visible", default: 0, null: false
    t.integer "views", default: 0, null: false
    t.string "project_title", limit: 250, default: "", null: false
    t.integer "bids", default: 0, null: false
    t.integer "bidsdeclined", default: 0, null: false
    t.integer "bidsretracted", default: 0, null: false
    t.integer "bidsshortlisted", default: 0, null: false
    t.string "budgetgroup", limit: 30, default: "", null: false
    t.text "additional_info", size: :medium
    t.column "status", "enum('draft','open','closed','expired','delisted','wait_approval','approval_accepted','frozen','finished','archived')", default: "draft", null: false
    t.datetime "close_date", null: false
    t.column "transfertype", "enum('userid','email')", default: "userid", null: false
    t.integer "transfer_to_userid", default: 0, null: false
    t.integer "transfer_from_userid", default: 0, null: false
    t.string "transfer_to_email", limit: 50, default: "", null: false
    t.column "transfer_status", "enum('','pending','accepted','rejected')", default: "", null: false
    t.string "transfer_code", limit: 32, default: "", null: false
    t.column "project_details", "enum('public','invite_only','realtime','unique','penny')", default: "public", null: false
    t.column "project_type", "enum('reverse','forward')", default: "reverse", null: false
    t.column "project_state", "enum('service','product')", default: "service", null: false
    t.column "bid_details", "enum('open','sealed','blind','full')", default: "open", null: false
    t.column "filter_rating", "enum('0','1')", default: "0", null: false
    t.column "filter_country", "enum('0','1')", default: "0", null: false
    t.column "filter_state", "enum('0','1')", default: "0", null: false
    t.column "filter_city", "enum('0','1')", default: "0", null: false
    t.column "filter_zip", "enum('0','1')", default: "0", null: false
    t.column "filter_underage", "enum('0','1')", default: "0", null: false
    t.column "filter_businessnumber", "enum('0','1')", default: "0", null: false
    t.column "filter_bidtype", "enum('0','1')", default: "0", null: false
    t.column "filter_budget", "enum('0','1')", default: "0", null: false
    t.integer "filter_escrow", default: 0, null: false
    t.integer "filter_gateway", default: 0, null: false
    t.integer "filter_ccgateway", default: 0, null: false
    t.integer "filter_offline", default: 0, null: false
    t.column "filter_publicboard", "enum('0','1')", default: "0", null: false
    t.column "filtered_rating", "enum('1','2','3','4','5')", default: "1", null: false
    t.string "filtered_country", limit: 50, default: "", null: false
    t.string "filtered_state", limit: 50, default: "", null: false
    t.string "filtered_city", limit: 20, default: "", null: false
    t.string "filtered_zip", limit: 10, default: "", null: false
    t.integer "filter_bidlimit", default: 0, null: false
    t.integer "filtered_bidlimit", default: 10, null: false
    t.column "filtered_bidtype", "enum('entire','hourly','daily','weekly','monthly','lot','weight','item')", default: "entire", null: false
    t.string "filtered_bidtypecustom", limit: 250, default: "", null: false
    t.integer "filtered_budgetid", default: 0, null: false
    t.column "filtered_auctiontype", "enum('regular','fixed','classified')", default: "regular", null: false
    t.string "classified_phone", limit: 32, default: "", null: false
    t.float "classified_price", limit: 53, default: 0.0, null: false
    t.integer "urgent", default: 0, null: false
    t.integer "buynow", default: 0, null: false
    t.float "buynow_price", limit: 53, default: 0.0, null: false
    t.integer "buynow_qty", default: 0, null: false
    t.integer "buynow_qty_lot", default: 0, null: false
    t.integer "items_in_lot", limit: 3, default: 0, null: false, unsigned: true
    t.integer "buynow_purchases", default: 0, null: false
    t.integer "reserve", default: 0, null: false
    t.float "reserve_price", limit: 53, default: 0.0, null: false
    t.integer "featured", default: 0, null: false
    t.datetime "featured_date", null: false
    t.integer "featured_searchresults", default: 0, null: false
    t.integer "highlite", default: 0, null: false
    t.integer "bold", default: 0, null: false
    t.integer "autorelist", default: 0, null: false
    t.datetime "autorelist_date", null: false
    t.float "startprice", limit: 53, default: 0.0, null: false
    t.float "retailprice", limit: 53, default: 0.0, null: false
    t.integer "uniquebidcount", default: 0, null: false
    t.text "paymethod", size: :medium
    t.text "paymethodcc", size: :medium
    t.text "paymethodoptions", size: :medium
    t.text "paymethodoptionsemail", size: :medium
    t.string "keywords", limit: 250, default: "", null: false
    t.float "currentprice", limit: 53, default: 0.0, null: false
    t.float "insertionfee", limit: 53, default: 0.0, null: false
    t.float "enhancementfee", limit: 53, default: 0.0, null: false
    t.float "fvf", limit: 53, default: 0.0, null: false
    t.integer "isfvfpaid", default: 0, null: false
    t.integer "isifpaid", default: 0, null: false
    t.integer "isenhancementfeepaid", default: 0, null: false
    t.integer "ifinvoiceid", default: 0, null: false
    t.integer "enhancementfeeinvoiceid", default: 0, null: false
    t.integer "fvfinvoiceid", default: 0, null: false
    t.integer "returnaccepted", default: 0, null: false
    t.column "returnwithin", "enum('0','3','7','14','30','60')", default: "0", null: false
    t.column "returngivenas", "enum('none','exchange','credit','moneyback')", default: "none", null: false
    t.column "returnshippaidby", "enum('none','buyer','seller')", default: "none", null: false
    t.text "returnpolicy", size: :medium
    t.integer "buyerfeedback", default: 0, null: false
    t.integer "sellerfeedback", default: 0, null: false
    t.integer "hasimage", default: 0, null: false
    t.integer "hasimageslideshow", default: 0, null: false
    t.integer "hasdigitalfile", default: 0, null: false
    t.integer "haswinner", default: 0, null: false
    t.integer "hasbuynowwinner", default: 0, null: false
    t.integer "winner_user_id", default: 0, null: false
    t.integer "donation", default: 0, null: false
    t.integer "charityid", default: 0, null: false
    t.integer "donationpercentage", default: 0, null: false
    t.integer "donermarkedaspaid", default: 0, null: false
    t.datetime "donermarkedaspaiddate", null: false
    t.integer "donationinvoiceid", default: 0, null: false
    t.integer "currencyid", default: 0, null: false
    t.integer "countryid", default: 0, null: false
    t.string "country", limit: 250, default: "", null: false
    t.string "state", limit: 250, default: "", null: false
    t.string "city", limit: 250, default: "", null: false
    t.string "zipcode", limit: 50, default: "", null: false
    t.string "sku", limit: 250, default: "", null: false
    t.string "upc", limit: 250, default: "", null: false
    t.string "ean", limit: 250, default: "", null: false
    t.string "isbn10", limit: 250, default: "", null: false
    t.string "isbn13", limit: 250, default: "", null: false
    t.string "partnumber", limit: 250, default: "", null: false
    t.string "modelnumber", limit: 250, default: "", null: false
    t.string "salestaxstate", limit: 250, default: "", null: false
    t.string "salestaxrate", limit: 10, default: "0", null: false
    t.integer "salestaxentirecountry", default: 0, null: false
    t.integer "salestaxshipping", default: 0, null: false
    t.integer "countdownresets", default: 0, null: false
    t.integer "bulkid", default: 0, null: false
    t.integer "updateid", default: 1, null: false
    t.integer "storeid", default: 0, null: false
    t.text "itemcondition", size: :medium
    t.text "imageurl", size: :medium
    t.integer "imageurl_attachid", default: 0, null: false
    t.integer "download_attachid", default: 0, null: false
    t.integer "itemstatus", default: 1, null: false
    t.integer "storecid", default: 0, null: false
    t.string "tags", limit: 100, null: false
    t.string "genre", limit: 100, null: false
    t.index ["charityid"], name: "charityid"
    t.index ["cid"], name: "cid"
    t.index ["countryid"], name: "countryid"
    t.index ["hasdigitalfile"], name: "hasdigitalfile"
    t.index ["hasimage"], name: "hasimage"
    t.index ["hasimageslideshow"], name: "hasimageslideshow"
    t.index ["isbn10"], name: "isbn10"
    t.index ["isbn13"], name: "isbn13"
    t.index ["modelnumber"], name: "modelnumber"
    t.index ["partnumber"], name: "partnumber"
    t.index ["project_details"], name: "project_details"
    t.index ["project_id"], name: "project_id"
    t.index ["project_state"], name: "project_state"
    t.index ["project_title"], name: "project_title"
    t.index ["project_type"], name: "project_type"
    t.index ["sku"], name: "sku"
    t.index ["status"], name: "status"
    t.index ["zipcode"], name: "zipcode"
  end

  create_table "ilance_subscription_user", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "subscriptionid", default: 1, null: false
    t.integer "user_id", default: -1, null: false
    t.column "paymethod", "enum('account','bank','visa','amex','mc','disc','paypal','paypal_pro','check','stormpay','cashu','moneybookers')", default: "account", null: false
    t.datetime "startdate", null: false
    t.datetime "renewdate", null: false
    t.integer "autopayment", default: 1, null: false
    t.column "autorenewal", "enum('0','1')", default: "1", null: false
    t.column "active", "enum('yes','no','cancelled')", default: "no", null: false
    t.integer "cancelled", default: 0, null: false
    t.integer "migrateto", default: 0, null: false
    t.column "migratelogic", "enum('none','waived','unpaid','paid')", default: "none", null: false
    t.integer "recurring", default: 0, null: false
    t.integer "invoiceid", default: 0, null: false
    t.integer "roleid", default: -1, null: false
    t.index ["active"], name: "active"
    t.index ["invoiceid"], name: "invoiceid"
    t.index ["migratelogic"], name: "migratelogic"
    t.index ["paymethod"], name: "paymethod"
    t.index ["subscriptionid"], name: "subscriptionid"
    t.index ["user_id"], name: "user_id"
  end

  create_table "ilance_users", primary_key: "user_id", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ipaddress", limit: 25, default: "", null: false
    t.integer "iprestrict", default: 0, null: false
    t.string "username", limit: 50, default: "", null: false
    t.string "password", limit: 32, default: "", null: false
    t.string "salt", limit: 5, default: "", null: false
    t.string "secretquestion", limit: 200, default: "", null: false
    t.string "secretanswer", limit: 32, default: "", null: false
    t.string "email", limit: 60, default: "", null: false
    t.string "first_name", limit: 100, default: "", null: false
    t.string "last_name", limit: 100, default: "", null: false
    t.string "address", limit: 200, default: "", null: false
    t.string "address2", limit: 200
    t.string "city", limit: 100, default: "", null: false
    t.string "state", limit: 100, default: "", null: false
    t.string "zip_code", limit: 10, default: "", null: false
    t.string "phone", limit: 20, default: "", null: false
    t.integer "country", default: 500, null: false
    t.datetime "date_added", null: false
    t.text "subcategories", size: :medium
    t.column "status", "enum('active','suspended','cancelled','unverified','banned','moderated')", default: "active", null: false
    t.integer "serviceawards", default: 0, null: false
    t.integer "productawards", default: 0, null: false
    t.integer "servicesold", default: 0, null: false
    t.integer "productsold", default: 0, null: false
    t.float "rating", limit: 53, default: 0.0, null: false
    t.integer "score", default: 0, null: false
    t.float "feedback", limit: 53, default: 0.0, null: false
    t.integer "bidstoday", default: 0, null: false
    t.integer "bidsthismonth", default: 0, null: false
    t.integer "auctiondelists", default: 0, null: false
    t.integer "bidretracts", default: 0, null: false
    t.datetime "lastseen", null: false
    t.date "dob", null: false
    t.string "rid", limit: 10, default: "", null: false
    t.string "account_number", limit: 25, default: "", null: false
    t.float "available_balance", limit: 53, default: 0.0, null: false
    t.float "total_balance", limit: 53, default: 0.0, null: false
    t.float "income_reported", limit: 53, default: 0.0, null: false
    t.float "income_spent", limit: 53, default: 0.0, null: false
    t.string "startpage", limit: 250, default: "main", null: false
    t.integer "styleid", null: false
    t.integer "project_distance", default: 1, null: false
    t.integer "currency_calculation", default: 1, null: false
    t.integer "languageid", null: false
    t.integer "currencyid", null: false
    t.string "timezone", limit: 250, null: false
    t.integer "notifyservices", null: false
    t.integer "notifyproducts", null: false
    t.text "notifyservicescats", size: :medium
    t.text "notifyproductscats", size: :medium
    t.date "lastemailservicecats", null: false
    t.date "lastemailproductcats", null: false
    t.integer "displayprofile", null: false
    t.integer "emailnotify", null: false
    t.integer "displayfinancials", null: false
    t.string "vatnumber", limit: 250, null: false
    t.string "regnumber", limit: 250, null: false
    t.string "dnbnumber", limit: 250, null: false
    t.string "companyname", limit: 100, null: false
    t.integer "usecompanyname", null: false
    t.integer "timeonsite", null: false
    t.integer "daysonsite", null: false
    t.integer "isadmin", default: 0, null: false
    t.text "permissions", size: :medium
    t.text "searchoptions", size: :medium
    t.float "rateperhour", limit: 53, default: 0.0, null: false
    t.text "profilevideourl", size: :medium
    t.text "profileintro", size: :medium
    t.column "gender", "enum('','male','female')", default: "", null: false
    t.column "freelancing", "enum('','individual','business')", default: "", null: false
    t.integer "autopayment", default: 1, null: false
    t.integer "posthtml", default: 0, null: false
    t.text "username_history", size: :medium
    t.datetime "password_lastchanged", null: false
    t.integer "role", default: 0, null: false
    t.integer "store", default: 0, null: false
    t.integer "store_pay", default: 0, null: false
    t.index ["city"], name: "city"
    t.index ["country"], name: "country"
    t.index ["email"], name: "email"
    t.index ["first_name"], name: "first_name"
    t.index ["freelancing"], name: "freelancing"
    t.index ["gender"], name: "gender"
    t.index ["last_name"], name: "last_name"
    t.index ["rating"], name: "rating"
    t.index ["score"], name: "score"
    t.index ["serviceawards"], name: "serviceawards"
    t.index ["state"], name: "state"
    t.index ["status"], name: "status"
    t.index ["username"], name: "username"
    t.index ["zip_code"], name: "zip_code"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "user_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["user_name"], name: "index_users_on_user_name"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
end

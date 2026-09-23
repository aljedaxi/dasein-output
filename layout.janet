(use spork/htmlgen)

(defn layout [children]
  [:html {:lang "en-ca"}
   [:meta {:charset "utf-8"}]
   [:meta {:name "viewport" :content "width=device-width,initial-scale=1.0"}]
   [:meta {:name "og:site_name" :content "dasein online"}]
   [:link {:href "/classless.css" :rel "stylesheet"}]
   [:link {:href "/favicon.ico" :ref "icon" :sizes "any"}]
   children])

(defn readall [file] (file/read file :all))

(->> stdin readall raw layout html prin)

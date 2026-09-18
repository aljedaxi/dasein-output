(use spork/htmlgen)

(def quipper [:script {:type "module"} (raw ``
const options = document.querySelector("#quips").options;
const option = options[Math.floor(Math.random() * options.length)];
document.querySelector("#quip").innerHTML = option.innerHTML;``)])

(def quips
  [
        "i am not"
        "welcome to my homepage! you can have fun here!"
        "encoding programs into janet, epic style"
          "i wish i could write something that wasn't secretly an ad"
        
          @["made with " [:a {:href "https://github.com/aljedaxi/sd/blob/main/zettel/dump-html"}
            "an exceptionally ugly shell script"]
          " for fun"]
          @["view the source code "
          [:a {:href "https://github.com/aljedaxi/dasein-output"} " here"]]
   ])

(defn listify [articles]
  (defn li [untrimmed]
    (let [s (string/trim untrimmed)]
     [:li [:a {:href (string "/articles/" s "/")} (string/replace-all "-" " " s)]]))
  [:ul (map li articles)])

(defn layout [children]
  [:html
     [:head
        [:link {:href "/daxi.css" :rel "stylesheet"}]
      [:meta {:charset "utf-8"}]
      [:link {:href "/favicon.ico" :ref "icon" :sizes "any"}]
      [:title "dasein online"]
      quipper
     ]
   [:body
      [:header {:id "quip"} "swag"]
    [:main [:h2 "good articles:"] children [:h2 "this is a personal website"]]
    [:datalist {:id "quips"} (map (fn [s] [:option s]) quips)]]])

(->> stdin file/lines listify layout html prin)

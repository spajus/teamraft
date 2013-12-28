module FontAwesome
  ICON_OPTIONS = %w[
 fa-adjust
 fa-anchor
 fa-archive
 fa-arrows
 fa-arrows-h
 fa-arrows-v
 fa-asterisk
 fa-ban
 fa-bar-chart-o
 fa-barcode
 fa-bars
 fa-beer
 fa-bell
 fa-bell-o
 fa-bolt
 fa-book
 fa-bookmark
 fa-bookmark-o
 fa-briefcase
 fa-bug
 fa-building-o
 fa-bullhorn
 fa-bullseye
 fa-calendar
 fa-calendar-o
 fa-camera
 fa-camera-retro
 fa-caret-square-o-down
 fa-caret-square-o-left
 fa-caret-square-o-right
 fa-caret-square-o-up
 fa-certificate
 fa-check
 fa-check-circle
 fa-check-circle-o
 fa-check-square
 fa-check-square-o
 fa-circle
 fa-circle-o
 fa-clock-o
 fa-cloud
 fa-cloud-download
 fa-cloud-upload
 fa-code
 fa-code-fork
 fa-coffee
 fa-cog
 fa-cogs
 fa-comment
 fa-comment-o
 fa-comments
 fa-comments-o
 fa-compass
 fa-credit-card
 fa-crop
 fa-crosshairs
 fa-cutlery
 fa-dashboard (alias)
 fa-desktop
 fa-dot-circle-o
 fa-download
 fa-edit (alias)
 fa-ellipsis-h
 fa-ellipsis-v
 fa-envelope
 fa-envelope-o
 fa-eraser
 fa-exchange
 fa-exclamation
 fa-exclamation-circle
 fa-exclamation-triangle
 fa-external-link
 fa-external-link-square
 fa-eye
 fa-eye-slash
 fa-female
 fa-fighter-jet
 fa-film
 fa-filter
 fa-fire
 fa-fire-extinguisher
 fa-flag
 fa-flag-checkered
 fa-flag-o
 fa-flash (alias)
 fa-flask
 fa-folder
 fa-folder-o
 fa-folder-open
 fa-folder-open-o
 fa-frown-o
 fa-gamepad
 fa-gavel
 fa-gear (alias)
 fa-gears (alias)
 fa-gift
 fa-glass
 fa-globe
 fa-group (alias)
 fa-hdd-o
 fa-headphones
 fa-heart
 fa-heart-o
 fa-home
 fa-inbox
 fa-info
 fa-info-circle
 fa-key
 fa-keyboard-o
 fa-laptop
 fa-leaf
 fa-legal (alias)
 fa-lemon-o
 fa-level-down
 fa-level-up
 fa-lightbulb-o
 fa-location-arrow
 fa-lock
 fa-magic
 fa-magnet
 fa-mail-forward (alias)
 fa-mail-reply (alias)
 fa-mail-reply-all
 fa-male
 fa-map-marker
 fa-meh-o
 fa-microphone
 fa-microphone-slash
 fa-minus
 fa-minus-circle
 fa-minus-square
 fa-minus-square-o
 fa-mobile
 fa-mobile-phone (alias)
 fa-money
 fa-moon-o
 fa-music
 fa-pencil
 fa-pencil-square
 fa-pencil-square-o
 fa-phone
 fa-phone-square
 fa-picture-o
 fa-plane
 fa-plus
 fa-plus-circle
 fa-plus-square
 fa-plus-square-o
 fa-power-off
 fa-print
 fa-puzzle-piece
 fa-qrcode
 fa-question
 fa-question-circle
 fa-quote-left
 fa-quote-right
 fa-random
 fa-refresh
 fa-reply
 fa-reply-all
 fa-retweet
 fa-road
 fa-rocket
 fa-rss
 fa-rss-square
 fa-search
 fa-search-minus
 fa-search-plus
 fa-share
 fa-share-square
 fa-share-square-o
 fa-shield
 fa-shopping-cart
 fa-sign-in
 fa-sign-out
 fa-signal
 fa-sitemap
 fa-smile-o
 fa-sort
 fa-sort-alpha-asc
 fa-sort-alpha-desc
 fa-sort-amount-asc
 fa-sort-amount-desc
 fa-sort-asc
 fa-sort-desc
 fa-sort-down (alias)
 fa-sort-numeric-asc
 fa-sort-numeric-desc
 fa-sort-up (alias)
 fa-spinner
 fa-square
 fa-square-o
 fa-star
 fa-star-half
 fa-star-half-empty (alias)
 fa-star-half-full (alias)
 fa-star-half-o
 fa-star-o
 fa-subscript
 fa-suitcase
 fa-sun-o
 fa-superscript
 fa-tablet
 fa-tachometer
 fa-tag
 fa-tags
 fa-tasks
 fa-terminal
 fa-thumb-tack
 fa-thumbs-down
 fa-thumbs-o-down
 fa-thumbs-o-up
 fa-thumbs-up
 fa-ticket
 fa-times
 fa-times-circle
 fa-times-circle-o
 fa-tint
 fa-toggle-down (alias)
 fa-toggle-left (alias)
 fa-toggle-right (alias)
 fa-toggle-up (alias)
 fa-trash-o
 fa-trophy
 fa-truck
 fa-umbrella
 fa-unlock
 fa-unlock-alt
 fa-unsorted (alias)
 fa-upload
 fa-user
 fa-users
 fa-video-camera
 fa-volume-down
 fa-volume-off
 fa-volume-up
 fa-warning (alias)
 fa-wheelchair
 fa-wrench

 fa-check-square
 fa-check-square-o
 fa-circle
 fa-circle-o
 fa-dot-circle-o
 fa-minus-square
 fa-minus-square-o
 fa-plus-square
 fa-plus-square-o
 fa-square
 fa-square-o

 fa-bitcoin (alias)
 fa-btc
 fa-cny (alias)
 fa-dollar (alias)
 fa-eur
 fa-euro (alias)
 fa-gbp
 fa-inr
 fa-jpy
 fa-krw
 fa-money
 fa-rmb (alias)
 fa-rouble (alias)
 fa-rub
 fa-ruble (alias)
 fa-rupee (alias)
 fa-try
 fa-turkish-lira (alias)
 fa-usd
 fa-won (alias)
 fa-yen (alias)

 fa-align-center
 fa-align-justify
 fa-align-left
 fa-align-right
 fa-bold
 fa-chain (alias)
 fa-chain-broken
 fa-clipboard
 fa-columns
 fa-copy (alias)
 fa-cut (alias)
 fa-dedent (alias)
 fa-eraser
 fa-file
 fa-file-o
 fa-file-text
 fa-file-text-o
 fa-files-o
 fa-floppy-o
 fa-font
 fa-indent
 fa-italic
 fa-link
 fa-list
 fa-list-alt
 fa-list-ol
 fa-list-ul
 fa-outdent
 fa-paperclip
 fa-paste (alias)
 fa-repeat
 fa-rotate-left (alias)
 fa-rotate-right (alias)
 fa-save (alias)
 fa-scissors
 fa-strikethrough
 fa-table
 fa-text-height
 fa-text-width
 fa-th
 fa-th-large
 fa-th-list
 fa-underline
 fa-undo
 fa-unlink (alias)

 fa-angle-double-down
 fa-angle-double-left
 fa-angle-double-right
 fa-angle-double-up
 fa-angle-down
 fa-angle-left
 fa-angle-right
 fa-angle-up
 fa-arrow-circle-down
 fa-arrow-circle-left
 fa-arrow-circle-o-down
 fa-arrow-circle-o-left
 fa-arrow-circle-o-right
 fa-arrow-circle-o-up
 fa-arrow-circle-right
 fa-arrow-circle-up
 fa-arrow-down
 fa-arrow-left
 fa-arrow-right
 fa-arrow-up
 fa-arrows
 fa-arrows-alt
 fa-arrows-h
 fa-arrows-v
 fa-caret-down
 fa-caret-left
 fa-caret-right
 fa-caret-square-o-down
 fa-caret-square-o-left
 fa-caret-square-o-right
 fa-caret-square-o-up
 fa-caret-up
 fa-chevron-circle-down
 fa-chevron-circle-left
 fa-chevron-circle-right
 fa-chevron-circle-up
 fa-chevron-down
 fa-chevron-left
 fa-chevron-right
 fa-chevron-up
 fa-hand-o-down
 fa-hand-o-left
 fa-hand-o-right
 fa-hand-o-up
 fa-long-arrow-down
 fa-long-arrow-left
 fa-long-arrow-right
 fa-long-arrow-up
 fa-toggle-down (alias)
 fa-toggle-left (alias)
 fa-toggle-right (alias)
 fa-toggle-up (alias)

 fa-arrows-alt
 fa-backward
 fa-compress
 fa-eject
 fa-expand
 fa-fast-backward
 fa-fast-forward
 fa-forward
 fa-pause
 fa-play
 fa-play-circle
 fa-play-circle-o
 fa-step-backward
 fa-step-forward
 fa-stop
 fa-youtube-play

 fa-adn
 fa-android
 fa-apple
 fa-bitbucket
 fa-bitbucket-square
 fa-bitcoin (alias)
 fa-btc
 fa-css3
 fa-dribbble
 fa-dropbox
 fa-facebook
 fa-facebook-square
 fa-flickr
 fa-foursquare
 fa-github
 fa-github-alt
 fa-github-square
 fa-gittip
 fa-google-plus
 fa-google-plus-square
 fa-html5
 fa-instagram
 fa-linkedin
 fa-linkedin-square
 fa-linux
 fa-maxcdn
 fa-pagelines
 fa-pinterest
 fa-pinterest-square
 fa-renren
 fa-skype
 fa-stack-exchange
 fa-stack-overflow
 fa-trello
 fa-tumblr
 fa-tumblr-square
 fa-twitter
 fa-twitter-square
 fa-vimeo-square
 fa-vk
 fa-weibo
 fa-windows
 fa-xing
 fa-xing-square
 fa-youtube
 fa-youtube-play
 fa-youtube-square

 fa-ambulance
 fa-h-square
 fa-hospital-o
 fa-medkit
 fa-plus-square
 fa-stethoscope
 fa-user-md
 fa-wheelchair
  ].reject { |i| i.include?('alias') }.uniq.sort.map { |i| i.gsub!('fa-', ''); [i.titleize, i] }
end


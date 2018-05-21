module View exposing (view)

import Css exposing (..)
import FontAwesome exposing (icon, gitHub)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, class, href, title, style)
import Html.Styled.Events exposing (onClick)
import OpaqueTypes.Theme as Theme exposing (Theme, getBackground)
import Svg
import Svg.Attributes
import Types exposing (Model, Msg)


grid : List ( String, String ) -> List ( String, String )
grid params =
    [ ( "display", "grid" ) ] ++ params


mainGrid : List ( String, String )
mainGrid =
    grid [ ( "grid-template-rows", "1fr 50px" ) ]


view : Model -> Html Msg
view { tracks, theme } =
    div
        [ style <|
            grid [ ( "grid-template-columns", "1fr 1fr" ) ]
        ]
        [ pageHalf theme elmSvg
        , pageHalf Theme.simple rustSvg
        ]


pageHalf : Theme -> Html Msg -> Html Msg
pageHalf theme mainContent =
    let
        ( styleList, cssList ) =
            Theme.getBackground theme
    in
        div
            [ style <| mainGrid ++ styleList
            , css <|
                [ height <| vh 100
                ]
                    ++ cssList
            ]
            [ main_ [ style <| grid [ ( "placeItems", "center" ) ] ] [ mainContent ]
            , footer theme
            ]


footer : Theme -> Html Msg
footer { highlight, highlightFont } =
    Html.Styled.footer
        [ css
            [ backgroundColor highlight
            , color highlightFont
            , textDecoration none
            , displayFlex
            , justifyContent center
            , alignItems center
            , fontSize <| px 30
            ]
        ]
        [ a
            [ href "https://github.com/TheHeartmann/audiobed_website"
            , title "Visit us on Github"
            ]
            [ styledIcon gitHub ]
        ]


styledIcon : FontAwesome.Icon -> Html Msg
styledIcon x =
    icon x |> fromUnstyled


polygon : { fill : String, points : String } -> Svg.Svg Msg
polygon { fill, points } =
    Svg.polygon [ Svg.Attributes.fill fill, Svg.Attributes.points points ] []


rect : { fill : String, x : String, y : String, transform : String, width : String, height : String } -> Svg.Svg Msg
rect { fill, x, y, transform, width, height } =
    Svg.rect
        [ Svg.Attributes.fill fill
        , Svg.Attributes.x x
        , Svg.Attributes.y y
        , Svg.Attributes.transform transform
        , Svg.Attributes.width width
        , Svg.Attributes.height height
        ]
        []


elmSvg : Html Msg
elmSvg =
    fromUnstyled <|
        Svg.svg
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "0"
            , Svg.Attributes.enableBackground "new 0 0 323.141 322.95"
            , Svg.Attributes.viewBox "0 0 323.141 322.95"
            ]
            [ Svg.g []
                [ polygon { fill = "#F0AD00", points = "161.649,152.782 231.514,82.916 91.783,82.916" }
                , polygon { fill = "#7FD13B", points = "8.867,0 79.241,70.375 232.213,70.375 161.838,0" }
                , rect
                    { fill = "#7FD13B", x = "192.99", y = "107.392", transform = "matrix(0.7071 0.7071 -0.7071 0.7071 186.4727 -127.2386)", width = "107.676", height = "108.167" }
                , polygon { fill = "#60B5CC", points = "323.298,143.724 323.298,0 179.573,0" }
                , polygon { fill = "#5A6378", points = "152.781,161.649 0,8.868 0,314.432" }
                , polygon { fill = "#F0AD00", points = "255.522,246.655 323.298,314.432 323.298,178.879" }
                , polygon { fill = "#60B5CC", points = "161.649,170.517 8.869,323.298 314.43,323.298" }
                ]
            ]


rustSvg : Html Msg
rustSvg =
    fromUnstyled <|
        Svg.svg
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width <| toString width
            , Svg.Attributes.height <| toString height
            ]
            [ Svg.path [ Svg.Attributes.d "M67.743 31.035a3.108 3.108 0 0 1 6.216 0a3.108 3.108 0 0 1 -6.216 0M30.666 59.175a3.108 3.108 0 0 1 6.216 0a3.108 3.108 0 0 1 -6.216 0m74.153.145a3.108 3.108 0 0 1 6.216 0a3.108 3.108 0 0 1 -6.216 0M39.663 63.578c1.43-.635 2.076-2.311 1.441-3.744l-1.379-3.118h5.423V81.16H34.207a38.265 38.265 0 0 1 -1.239-14.607zm22.685 0.601v-7.205h12.914c.667 0 4.71.771 4.71 3.794c0 2.51-3.101 3.41-5.651 3.41zM44.717 102.972a3.108 3.108 0 0 1 6.216 0a3.108 3.108 0 0 1 -6.216 0m46.051.145a3.108 3.108 0 0 1 6.216 0a3.108 3.108 0 0 1 -6.216 0m.961-7.048c-1.531-.328-3.037.646-3.365 2.18l-1.56 7.28a38.265 38.265 0 0 1 -31.911-.153l-1.559-7.28c-.328-1.532-1.834-2.508-3.364-2.179l-6.427 1.38a38.265 38.265 0 0 1 -3.323 -3.917h31.272c.354 0 .59-.064.59-.386V81.932c0-.322-.236-.386-.59-.386h-9.146v-7.012h9.892c.903 0 4.828.258 6.083 5.275.393 1.543 1.256 6.562 1.846 8.169.588 1.802 2.982 5.402 5.533 5.402h16.146a38.265 38.265 0 0 1 -3.544 4.102zm17.365-29.207a38.265 38.265 0 0 1 .081 6.643 h-3.926c-.393 0-.551.258-.551.643v1.803c0 4.244-2.393 5.167-4.49 5.402-1.997 .225-4.211-.836-4.484-2.058-1.178-6.626-3.141-8.041-6.241-10.486 3.847-2.443,7.85-6.047 7.85-10.871 0-5.209-3.571-8.49-6.005-10.099-3.415-2.251-7.196-2.702-8.216-2.702H42.509a38.265 38.265 0 0 1 21.408-12.082l4.786 5.021c1.082 1.133 2.874 1.175 4.006.092l5.355-5.122a38.265 38.265 0 0 1 26.196 18.657l-3.666 8.28c-.633 1.433.013 3.109 1.442 3.744zm9.143.134-.125-1.28 3.776-3.522c.768-.716.481-2.157-.501-2.523l-4.827-1.805-.378-1.246 3.011-4.182c.614-.85.05-2.207-.984-2.377l-5.09-.828-.612-1.143 2.139-4.695c.438-.956-.376-2.179-1.428-2.139l-5.166.18-.816-.99 1.187-5.032c.24-1.022-.797-2.06-1.819-1.82l-5.031 1.186-.992-.816.181-5.166c.04-1.046-1.184-1.863-2.138-1.429l-4.694 2.14-1.143-.613-.83-5.091c-.168-1.032-1.526-1.596-2.376-.984l-4.185 3.011-1.244-.377-1.805-4.828c-.366-.984-1.808-1.267-2.522-.503l-3.522 3.779-1.28-.125-2.72-4.395c-.55-.89-2.023-.89-2.571 0l-2.72 4.395-1.281.125-3.523-3.779c-.714-.764-2.156-.481-2.522.503l-1.805 4.828-1.245.377-4.184-3.011c-.85-.614-2.209-.048-2.377.984l-.83 5.091-1.143.613-4.694-2.14c-.954-.436-2.178.383-2.138 1.429l.18 5.166-.992.816-5.031-1.186c-1.022-.238-2.06.798-1.82 1.82l1.185 5.032-.814.99-5.166-.18c-1.042-.03-1.863 1.183-1.429 2.139l2.14 4.695-.613 1.143-5.09.828c-1.034.168-1.594 1.527-.984 2.377l3.011 4.182-.378 1.246-4.828 1.805c-.98.366-1.267 1.807-.501 2.523l3.777 3.522-.125 1.28-4.394 2.72c-.89.55-.89 2.023 0 2.571l4.394 2.72.125 1.28-3.777 3.523c-.766.714-.479 2.154.501 2.522l4.828 1.805.378 1.246-3.011 4.183c-.612.852-.049 2.21.985 2.376l5.089.828.613 1.145-2.14 4.693c-.436.954.387 2.181 1.429 2.139l5.164-.181.816.992-1.185 5.033c-.24 1.02.798 2.056 1.82 1.816l5.031-1.185.992.814-.18 5.167c-.04 1.046 1.184 1.864 2.138 1.428l4.694-2.139 1.143.613.83 5.088c.168 1.036 1.527 1.596 2.377.986l4.182-3.013 1.246.379 1.805 4.826c.366.98 1.808 1.269 2.522.501l3.523-3.777 1.281.128 2.72 4.394c.548.886 2.021.888 2.571 0l2.72-4.394 1.28-.128 3.522 3.777c.714.768 2.156.479 2.522-.501l1.805-4.826 1.246-.379 4.183 3.013c.85.61 2.208.048 2.376-.986l.83-5.088 1.143-.613 4.694 2.139c.954.436 2.176-.38 2.138-1.428l-.18-5.167.991-.814 5.031 1.185c1.022.24 2.059-.796 1.819-1.816l-1.185-5.033.814-.992 5.166.181c1.042.042 1.866-1.185 1.428-2.139l-2.139-4.693.612-1.145 5.09-.828c1.036-.166 1.598-1.524.984-2.376l-3.011-4.183.378-1.246 4.827-1.805c.982-.368 1.269-1.808.501-2.522l-3.776-3.523.125-1.28 4.394-2.72c.89-.548.891-2.021.001-2.571z" ]
                []
            ]

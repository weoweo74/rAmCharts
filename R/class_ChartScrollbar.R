#' @include class_AmObject.R utils_basicClassUnions.R
NULL

#' @title ChartScrollbar class
#' @author datastorm-open
#' 
#' @description Creates a scrollbar for amSerialChart and amXYChart charts.
#' @details Run \code{api("ChartScrollbar")} for more information and all avalaible properties.
#' 
#' @slot enabled \code{logical}.
#' Specifies if the chart should be updated while dragging/resizing the scrollbar
#' or only at the moment when user releases mouse button.
#' @slot graph \code{list}.
#' Specifies which graph properties will be displayed in the scrollbar.
#' Only Serial chart's scrollbar can display a graph.
#' @slot listeners \code{list} containining the listeners to add to the object.
#' The list must be named as in the official API. Each element must be a character string.
#' @slot otherProperties \code{list}
#' containing other avalaible properties not yet implemented in the package.
#' @slot value \code{numeric}.
#' 
#' @export
setClass(Class = "ChartScrollbar", contains = "AmObject",
         representation = representation(graph = "listOrCharacter", enabled = "logical" ))

#' @title Initializes a ChartScrollbar
#' @param .Object \linkS4class{ChartScrollbar}.
#' @param graph \linkS4class{AmGraph}.
#' Specifies which graph will be displayed in the scrollbar.
#' @param enabled \code{logical}, 
#' specifies if the chart should be updated while dragging/resizing the scrollbar
#' or only when user releases mouse button.
#' @param ... other properties of ChartScrollbar.
#' Run : api("ChartScrollbar") for more information.
#' 
#' @examples
#' new("ChartScrollbar", graph = "g1")
#' new("ChartScrollbar", graph = amGraph(test = 1))
#' @rdname initialize-ChartScrollbar
#' @export
setMethod(f = "initialize", signature = "ChartScrollbar",
          definition = function(.Object,
                                graph,
                                enabled, ...)
          { 
            if (!missing(graph)) {
              .Object <- setGraph(.Object, graph = graph)
            } else {}
            if(!missing(enabled)){
              .Object@enabled <- enabled
            } else {}
            .Object <- setProperties(.Object,...)
            validObject(.Object)
            return(.Object)
          })

#' @rdname initialize-ChartScrollbar
#' @examples
#' chartScrollbar()
#' chartScrollbar(enabled = TRUE)
#' @export
chartScrollbar <- function(graph, enabled = TRUE,...){
  .Object <- new("ChartScrollbar", enabled = enabled)
  if (!missing(graph)) {
    .Object <- setGraph(.Object, graph)
  } else {}
  .Object <- setProperties(.Object, ...)
  validObject(.Object)
  return( .Object )
}

#' @rdname initialize-ChartScrollbar
#' @description ChartScrollbarSettings sets settings for chart scrollbar.
#' If you change a property after the chart is initialized,
#' you should call stockChart.validateNow() method.
#' If there is no default value specified, default value of ChartScrollbar class will be used.
#' Run \code{api("ChartScrollbarSettings")} for more informations.
#' @examples
#' chartScrollbar()
#' chartScrollbar(enabled = TRUE)
#' @export
chartScrollbarSettings <- function(graph, enabled = TRUE,...){
  .Object <- new("ChartScrollbar", enabled = enabled)
  if (!missing(graph)) {
    .Object <- setGraph(.Object, graph)
  } else {}
  .Object <- setProperties(.Object, ...)
  validObject(.Object)
  return( .Object )
}

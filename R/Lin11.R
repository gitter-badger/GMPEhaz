#' GMPE function for Lin et al.(2011)
#'
#' \code{Lin11Rock} returns the ground-motion prediction (rock site) with it sigma of Lin et al.(2011) GMPE.
#'
#'Lin, P.-S., C.-T. Lee, C.-T. Cheng, and C.-H. Sung (2011), Response spectral attenuation relations
#'for shallow crustal earthquakes in taiwan, Engineering Geology, 121(3-4), 150-164.
#'\url{http://dx.doi.org/10.1016/j.enggeo.2011.04.019}
#'
#' @param Mag Earthquake momnet magnitude, Numeric.
#' @param Rrup Rupture distance(km), Numeric.
#' @param Prd Period of spectral acceleration.
#' @param hwflag hanging-wall flag, 1 for hanging-wall.
#'
#' @return A list will be return, including mag, Rrup, specT, period, lnY, sigma, iflag.
#'
#' @examples
#' Lin11Rock(6, 20, 0, 0)
#' Lin11Rock(7, 10, 0, 0)
#'
#' @export
Lin11Rock <- function(Mag, Rrup, Prd, hwflag=0){
  if(hwflag==0){
    retvals <- .Fortran("Lin_fw_rock", mag=as.single(Mag), rupdist=as.single(Rrup), specT=as.single(Prd),
                        period=as.single(0), lnY=as.single(0.1), sigma=as.single(0.1), iflag=as.integer(1))
  }else{
    retvals <- .Fortran("Lin_hw_rock", mag=as.single(Mag), rupdist=as.single(Rrup), specT=as.single(Prd),
                        period=as.single(0), lnY=as.single(0.1), sigma=as.single(1), iflag=as.integer(1))
  }
  names(retvals) <- c("mag", "Rrup", "specT", "period", "lnY", "sigma", "iflag")
  return(retvals)
}

#' GMPE function for Lin et al.(2011)
#'
#' \code{Lin11Soil} returns the ground-motion prediction (soil site) with it sigma of Lin et al.(2011) GMPE.
#'
#'Lin, P.-S., C.-T. Lee, C.-T. Cheng, and C.-H. Sung (2011), Response spectral attenuation relations
#'for shallow crustal earthquakes in taiwan, Engineering Geology, 121(3-4), 150-164.
#'\url{http://dx.doi.org/10.1016/j.enggeo.2011.04.019}
#'
#' @param Mag Earthquake momnet magnitude, Numeric.
#' @param Rrup Rupture distance(km), Numeric.
#' @param Prd Period of spectral acceleration.
#' @param hwflag hanging-wall flag, 1 for hanging-wall.
#'
#' @return A list will be return, including mag, Rrup, specT, period, lnY, sigma, iflag.
#'
#' @examples
#' Lin11Soil(6, 20, 0, 0)
#' Lin11Soil(7, 10, 0, 0)
#'
#' @export
Lin11Soil <- function(Mag, Rrup, Prd, hwflag=0){
  if(hwflag==0){
    retvals <- .Fortran("Lin_fw_soil", mag=as.single(Mag), rupdist=as.single(Rrup), specT=as.single(Prd),
                        period=as.single(0), lnY=as.single(0.1), sigma=as.single(0.1), iflag=as.integer(1))
  }else{
    retvals <- .Fortran("Lin_hw_soil", mag=as.single(Mag), rupdist=as.single(Rrup), specT=as.single(Prd),
                        period=as.single(0), lnY=as.single(0.1), sigma=as.single(1), iflag=as.integer(1))
  }
  names(retvals) <- c("mag", "Rrup", "specT", "period", "lnY", "sigma", "iflag")
  return(retvals)
}

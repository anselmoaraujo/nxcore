% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/utilities.r
\name{carry_prices_forward}
\alias{carry_prices_forward}
\title{Carry prices forward}
\usage{
carry_prices_forward(x, na.rm = TRUE)
}
\arguments{
\item{x}{an xtx object that may have mulitple columns and NA's}

\item{na.rm}{should the rows with NA's be omitted after carrying forward?}
}
\value{
an xts object where NA's are replace by the last valid value. Note
        that if NA's appear in the beginning of the series they will appear
        in the result.
}
\description{
Carry prices forward
}
\examples{
data(aapl_fix)
data(a_fix)
aapl_cons = consolidate_prices(aapl_fix$sys_date, aapl_fix$sys_time,
 aapl_fix$td_price, aapl_fix$td_size)
a_cons = consolidate_prices(a_fix$sys_date, a_fix$sys_time,
 a_fix$td_price, a_fix$td_size)
trades = merge(aapl_cons$price, a_cons$price)
trades = carry_prices_forward(trades)
names(trades) = c("aapl", "a")
cointegration_p_matrix(trades)
}


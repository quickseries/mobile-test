package com.quickseries.mobiletest.data

import retrofit2.HttpException

/**
 * Exception that occurs during an error on a service call.
 */
open class ServiceException(override val message: String, open val t: Throwable? = null) :
    Exception(message, t)

/**
 * Exception that occurs during an error on a service call with an Http code other than 200.
 */
open class HttpServiceException(override val message: String, e: HttpException? = null) :
    ServiceException(message, e)

/**
 * Exception that occurs during an error on a service call with an Http code
 * between 400 and 500 exclusively.
 */
class UnauthorizeServiceException(message: String, e: HttpException? = null) :
    HttpServiceException(message, e)

/**
 * Exception that occurs during an error on a service call with an invalid payload.
 */
class PayloadServiceException(override val message: String, override val t: Throwable? = null) :
    ServiceException(message, t)

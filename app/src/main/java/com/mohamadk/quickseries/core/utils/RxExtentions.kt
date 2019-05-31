package com.mohamadk.quickseries.core.utils


import androidx.lifecycle.LiveData
import androidx.lifecycle.LiveDataReactiveStreams.fromPublisher
import com.mohamadk.middleman.networkstate.NetworkState
import com.mohamadk.quickseries.R
import com.mohamadk.quickseries.core.App
import com.mohamadk.quickseries.core.repo.BaseResponse
import io.reactivex.BackpressureStrategy
import io.reactivex.Observable
import io.reactivex.functions.Function
import java.io.IOException
import java.net.ConnectException
import java.net.SocketTimeoutException

fun <T> Observable<T>.toLiveData(strategy: BackpressureStrategy = BackpressureStrategy.LATEST): LiveData<T> {
    return fromPublisher(toFlowable(strategy))
}

fun <T : BaseResponse<*>> handleConnectionErrors(responseModel: T): Function<in Throwable, out T> {
    return Function { throwable ->
        if (throwable is SocketTimeoutException || throwable is IOException) {
            responseModel.networkState =
                NetworkState.error(App.context.getString(R.string.server_is_not_responding_right_now_please_try_again_later))
            responseModel
        } else if (throwable is ConnectException) {
            responseModel.networkState =
                NetworkState.error(App.context.getString(R.string.cannot_connect_to_the_server_please_check_you_internet_connection))
            responseModel
        } else {
            responseModel.networkState = NetworkState.error(throwable.message)
            responseModel
        }
    }
}

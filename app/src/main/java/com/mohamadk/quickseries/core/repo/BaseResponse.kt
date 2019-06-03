package com.mohamadk.quickseries.core.repo

import com.mohamadk.middleman.networkstate.NetworkState

class BaseResponse<T>(
    var networkState: NetworkState? = null
    , val result: T? = null
)
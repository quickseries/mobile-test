package com.lidboud.kotlin.injection.module

import com.lidboud.kotlin.data.datasource.DataSource
import com.lidboud.kotlin.data.datasource.LocalDataSource
import com.lidboud.kotlin.repository.DataRepository
import com.lidboud.kotlin.repository.DataRepositoryImpl
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class DataModule {

    @Singleton
    @Provides
    internal fun provideDataRepository(dataRepository: DataRepositoryImpl): DataRepository {
        return dataRepository
    }

    @Provides
    internal fun provideDataDataSource(dataSource: LocalDataSource): DataSource {
        return dataSource
    }

}
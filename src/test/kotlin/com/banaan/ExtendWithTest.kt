package com.banaan

import io.mockk.MockKAnnotations
import io.mockk.impl.annotations.MockK
import io.mockk.junit5.MockKExtension
import org.junit.Test
import org.junit.jupiter.api.TestInstance
import org.junit.jupiter.api.extension.ExtendWith

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@ExtendWith(MockKExtension::class)
class ExtendWithTest {
    @MockK
    lateinit var classToMock: ClassToMock

    @Test
    fun testBasicRequest() {
//        MockKAnnotations.init(this)
        val app = UseMock(classToMock)
    }
}

class UseMock(classToMock: ClassToMock) {

}

class ClassToMock {

}

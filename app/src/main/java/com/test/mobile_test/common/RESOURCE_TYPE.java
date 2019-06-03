package com.test.mobile_test.common;

public enum RESOURCE_TYPE {
    RESTAURANT("ac5bd194-11de-48f6-94db-fd16cfccb570") {
        @Override
        public String getJsonFileName() {
            return "restaurants.json";
        }
    },
    VACATION_SPOT("83a5bc0d-bae7-4b3f-b8d9-01c969785783") {
        @Override
        public String getJsonFileName() {
            return "vacation-spot.json";
        }
    };

    private String resourceVal;
    private String jsonFileName;

    public String getJsonFileName() {
        return jsonFileName;
    }

    RESOURCE_TYPE(String resourceVal) {
        this.resourceVal = resourceVal;
    }

    public String getResourceVal() {
        return resourceVal;
    }
}

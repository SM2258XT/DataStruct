package com.xhu.datastruct;

import com.xhu.domain.Staff;

public interface MyList {

    abstract int size();

    abstract boolean push(Staff staff);

    abstract boolean remove(int id);

    abstract boolean exist(int id);

    abstract boolean isEmpty();

    abstract Staff getStaffById(final int id);

    abstract Staff getStaffByIndex(final int index);

    abstract Staff getStaffByName(final String name);
}

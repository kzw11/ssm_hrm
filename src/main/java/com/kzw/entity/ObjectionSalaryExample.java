package com.kzw.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ObjectionSalaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ObjectionSalaryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andEmpIdIsNull() {
            addCriterion("emp_id is null");
            return (Criteria) this;
        }

        public Criteria andEmpIdIsNotNull() {
            addCriterion("emp_id is not null");
            return (Criteria) this;
        }

        public Criteria andEmpIdEqualTo(Integer value) {
            addCriterion("emp_id =", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdNotEqualTo(Integer value) {
            addCriterion("emp_id <>", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdGreaterThan(Integer value) {
            addCriterion("emp_id >", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("emp_id >=", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdLessThan(Integer value) {
            addCriterion("emp_id <", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdLessThanOrEqualTo(Integer value) {
            addCriterion("emp_id <=", value, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdIn(List<Integer> values) {
            addCriterion("emp_id in", values, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdNotIn(List<Integer> values) {
            addCriterion("emp_id not in", values, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdBetween(Integer value1, Integer value2) {
            addCriterion("emp_id between", value1, value2, "empId");
            return (Criteria) this;
        }

        public Criteria andEmpIdNotBetween(Integer value1, Integer value2) {
            addCriterion("emp_id not between", value1, value2, "empId");
            return (Criteria) this;
        }

        public Criteria andTimeIsNull() {
            addCriterion("time is null");
            return (Criteria) this;
        }

        public Criteria andTimeIsNotNull() {
            addCriterion("time is not null");
            return (Criteria) this;
        }

        public Criteria andTimeEqualTo(Date value) {
            addCriterion("time =", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotEqualTo(Date value) {
            addCriterion("time <>", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThan(Date value) {
            addCriterion("time >", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("time >=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThan(Date value) {
            addCriterion("time <", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThanOrEqualTo(Date value) {
            addCriterion("time <=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeIn(List<Date> values) {
            addCriterion("time in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotIn(List<Date> values) {
            addCriterion("time not in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeBetween(Date value1, Date value2) {
            addCriterion("time between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotBetween(Date value1, Date value2) {
            addCriterion("time not between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andErrcontentIsNull() {
            addCriterion("errcontent is null");
            return (Criteria) this;
        }

        public Criteria andErrcontentIsNotNull() {
            addCriterion("errcontent is not null");
            return (Criteria) this;
        }

        public Criteria andErrcontentEqualTo(String value) {
            addCriterion("errcontent =", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentNotEqualTo(String value) {
            addCriterion("errcontent <>", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentGreaterThan(String value) {
            addCriterion("errcontent >", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentGreaterThanOrEqualTo(String value) {
            addCriterion("errcontent >=", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentLessThan(String value) {
            addCriterion("errcontent <", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentLessThanOrEqualTo(String value) {
            addCriterion("errcontent <=", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentLike(String value) {
            addCriterion("errcontent like", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentNotLike(String value) {
            addCriterion("errcontent not like", value, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentIn(List<String> values) {
            addCriterion("errcontent in", values, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentNotIn(List<String> values) {
            addCriterion("errcontent not in", values, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentBetween(String value1, String value2) {
            addCriterion("errcontent between", value1, value2, "errcontent");
            return (Criteria) this;
        }

        public Criteria andErrcontentNotBetween(String value1, String value2) {
            addCriterion("errcontent not between", value1, value2, "errcontent");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNull() {
            addCriterion("money is null");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNotNull() {
            addCriterion("money is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyEqualTo(Double value) {
            addCriterion("money =", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotEqualTo(Double value) {
            addCriterion("money <>", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThan(Double value) {
            addCriterion("money >", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("money >=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThan(Double value) {
            addCriterion("money <", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThanOrEqualTo(Double value) {
            addCriterion("money <=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyIn(List<Double> values) {
            addCriterion("money in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotIn(List<Double> values) {
            addCriterion("money not in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyBetween(Double value1, Double value2) {
            addCriterion("money between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotBetween(Double value1, Double value2) {
            addCriterion("money not between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andReissueTimeIsNull() {
            addCriterion("reissue_time is null");
            return (Criteria) this;
        }

        public Criteria andReissueTimeIsNotNull() {
            addCriterion("reissue_time is not null");
            return (Criteria) this;
        }

        public Criteria andReissueTimeEqualTo(Date value) {
            addCriterion("reissue_time =", value, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeNotEqualTo(Date value) {
            addCriterion("reissue_time <>", value, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeGreaterThan(Date value) {
            addCriterion("reissue_time >", value, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("reissue_time >=", value, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeLessThan(Date value) {
            addCriterion("reissue_time <", value, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeLessThanOrEqualTo(Date value) {
            addCriterion("reissue_time <=", value, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeIn(List<Date> values) {
            addCriterion("reissue_time in", values, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeNotIn(List<Date> values) {
            addCriterion("reissue_time not in", values, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeBetween(Date value1, Date value2) {
            addCriterion("reissue_time between", value1, value2, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andReissueTimeNotBetween(Date value1, Date value2) {
            addCriterion("reissue_time not between", value1, value2, "reissueTime");
            return (Criteria) this;
        }

        public Criteria andIsexecuteIsNull() {
            addCriterion("isexecute is null");
            return (Criteria) this;
        }

        public Criteria andIsexecuteIsNotNull() {
            addCriterion("isexecute is not null");
            return (Criteria) this;
        }

        public Criteria andIsexecuteEqualTo(Integer value) {
            addCriterion("isexecute =", value, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteNotEqualTo(Integer value) {
            addCriterion("isexecute <>", value, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteGreaterThan(Integer value) {
            addCriterion("isexecute >", value, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteGreaterThanOrEqualTo(Integer value) {
            addCriterion("isexecute >=", value, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteLessThan(Integer value) {
            addCriterion("isexecute <", value, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteLessThanOrEqualTo(Integer value) {
            addCriterion("isexecute <=", value, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteIn(List<Integer> values) {
            addCriterion("isexecute in", values, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteNotIn(List<Integer> values) {
            addCriterion("isexecute not in", values, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteBetween(Integer value1, Integer value2) {
            addCriterion("isexecute between", value1, value2, "isexecute");
            return (Criteria) this;
        }

        public Criteria andIsexecuteNotBetween(Integer value1, Integer value2) {
            addCriterion("isexecute not between", value1, value2, "isexecute");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
package com.kzw.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SalaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SalaryExample() {
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

        public Criteria andBaseIsNull() {
            addCriterion("base is null");
            return (Criteria) this;
        }

        public Criteria andBaseIsNotNull() {
            addCriterion("base is not null");
            return (Criteria) this;
        }

        public Criteria andBaseEqualTo(Double value) {
            addCriterion("base =", value, "base");
            return (Criteria) this;
        }

        public Criteria andBaseNotEqualTo(Double value) {
            addCriterion("base <>", value, "base");
            return (Criteria) this;
        }

        public Criteria andBaseGreaterThan(Double value) {
            addCriterion("base >", value, "base");
            return (Criteria) this;
        }

        public Criteria andBaseGreaterThanOrEqualTo(Double value) {
            addCriterion("base >=", value, "base");
            return (Criteria) this;
        }

        public Criteria andBaseLessThan(Double value) {
            addCriterion("base <", value, "base");
            return (Criteria) this;
        }

        public Criteria andBaseLessThanOrEqualTo(Double value) {
            addCriterion("base <=", value, "base");
            return (Criteria) this;
        }

        public Criteria andBaseIn(List<Double> values) {
            addCriterion("base in", values, "base");
            return (Criteria) this;
        }

        public Criteria andBaseNotIn(List<Double> values) {
            addCriterion("base not in", values, "base");
            return (Criteria) this;
        }

        public Criteria andBaseBetween(Double value1, Double value2) {
            addCriterion("base between", value1, value2, "base");
            return (Criteria) this;
        }

        public Criteria andBaseNotBetween(Double value1, Double value2) {
            addCriterion("base not between", value1, value2, "base");
            return (Criteria) this;
        }

        public Criteria andAchievementIsNull() {
            addCriterion("achievement is null");
            return (Criteria) this;
        }

        public Criteria andAchievementIsNotNull() {
            addCriterion("achievement is not null");
            return (Criteria) this;
        }

        public Criteria andAchievementEqualTo(Double value) {
            addCriterion("achievement =", value, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementNotEqualTo(Double value) {
            addCriterion("achievement <>", value, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementGreaterThan(Double value) {
            addCriterion("achievement >", value, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementGreaterThanOrEqualTo(Double value) {
            addCriterion("achievement >=", value, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementLessThan(Double value) {
            addCriterion("achievement <", value, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementLessThanOrEqualTo(Double value) {
            addCriterion("achievement <=", value, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementIn(List<Double> values) {
            addCriterion("achievement in", values, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementNotIn(List<Double> values) {
            addCriterion("achievement not in", values, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementBetween(Double value1, Double value2) {
            addCriterion("achievement between", value1, value2, "achievement");
            return (Criteria) this;
        }

        public Criteria andAchievementNotBetween(Double value1, Double value2) {
            addCriterion("achievement not between", value1, value2, "achievement");
            return (Criteria) this;
        }

        public Criteria andRewardIdIsNull() {
            addCriterion("reward_id is null");
            return (Criteria) this;
        }

        public Criteria andRewardIdIsNotNull() {
            addCriterion("reward_id is not null");
            return (Criteria) this;
        }

        public Criteria andRewardIdEqualTo(Integer value) {
            addCriterion("reward_id =", value, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdNotEqualTo(Integer value) {
            addCriterion("reward_id <>", value, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdGreaterThan(Integer value) {
            addCriterion("reward_id >", value, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("reward_id >=", value, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdLessThan(Integer value) {
            addCriterion("reward_id <", value, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdLessThanOrEqualTo(Integer value) {
            addCriterion("reward_id <=", value, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdIn(List<Integer> values) {
            addCriterion("reward_id in", values, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdNotIn(List<Integer> values) {
            addCriterion("reward_id not in", values, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdBetween(Integer value1, Integer value2) {
            addCriterion("reward_id between", value1, value2, "rewardId");
            return (Criteria) this;
        }

        public Criteria andRewardIdNotBetween(Integer value1, Integer value2) {
            addCriterion("reward_id not between", value1, value2, "rewardId");
            return (Criteria) this;
        }

        public Criteria andSocialsecIsNull() {
            addCriterion("socialsec is null");
            return (Criteria) this;
        }

        public Criteria andSocialsecIsNotNull() {
            addCriterion("socialsec is not null");
            return (Criteria) this;
        }

        public Criteria andSocialsecEqualTo(Double value) {
            addCriterion("socialsec =", value, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecNotEqualTo(Double value) {
            addCriterion("socialsec <>", value, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecGreaterThan(Double value) {
            addCriterion("socialsec >", value, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecGreaterThanOrEqualTo(Double value) {
            addCriterion("socialsec >=", value, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecLessThan(Double value) {
            addCriterion("socialsec <", value, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecLessThanOrEqualTo(Double value) {
            addCriterion("socialsec <=", value, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecIn(List<Double> values) {
            addCriterion("socialsec in", values, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecNotIn(List<Double> values) {
            addCriterion("socialsec not in", values, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecBetween(Double value1, Double value2) {
            addCriterion("socialsec between", value1, value2, "socialsec");
            return (Criteria) this;
        }

        public Criteria andSocialsecNotBetween(Double value1, Double value2) {
            addCriterion("socialsec not between", value1, value2, "socialsec");
            return (Criteria) this;
        }

        public Criteria andDisgreeIsNull() {
            addCriterion("disgree is null");
            return (Criteria) this;
        }

        public Criteria andDisgreeIsNotNull() {
            addCriterion("disgree is not null");
            return (Criteria) this;
        }

        public Criteria andDisgreeEqualTo(Integer value) {
            addCriterion("disgree =", value, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeNotEqualTo(Integer value) {
            addCriterion("disgree <>", value, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeGreaterThan(Integer value) {
            addCriterion("disgree >", value, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeGreaterThanOrEqualTo(Integer value) {
            addCriterion("disgree >=", value, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeLessThan(Integer value) {
            addCriterion("disgree <", value, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeLessThanOrEqualTo(Integer value) {
            addCriterion("disgree <=", value, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeIn(List<Integer> values) {
            addCriterion("disgree in", values, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeNotIn(List<Integer> values) {
            addCriterion("disgree not in", values, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeBetween(Integer value1, Integer value2) {
            addCriterion("disgree between", value1, value2, "disgree");
            return (Criteria) this;
        }

        public Criteria andDisgreeNotBetween(Integer value1, Integer value2) {
            addCriterion("disgree not between", value1, value2, "disgree");
            return (Criteria) this;
        }

        public Criteria andIshandleIsNull() {
            addCriterion("ishandle is null");
            return (Criteria) this;
        }

        public Criteria andIshandleIsNotNull() {
            addCriterion("ishandle is not null");
            return (Criteria) this;
        }

        public Criteria andIshandleEqualTo(Integer value) {
            addCriterion("ishandle =", value, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleNotEqualTo(Integer value) {
            addCriterion("ishandle <>", value, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleGreaterThan(Integer value) {
            addCriterion("ishandle >", value, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleGreaterThanOrEqualTo(Integer value) {
            addCriterion("ishandle >=", value, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleLessThan(Integer value) {
            addCriterion("ishandle <", value, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleLessThanOrEqualTo(Integer value) {
            addCriterion("ishandle <=", value, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleIn(List<Integer> values) {
            addCriterion("ishandle in", values, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleNotIn(List<Integer> values) {
            addCriterion("ishandle not in", values, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleBetween(Integer value1, Integer value2) {
            addCriterion("ishandle between", value1, value2, "ishandle");
            return (Criteria) this;
        }

        public Criteria andIshandleNotBetween(Integer value1, Integer value2) {
            addCriterion("ishandle not between", value1, value2, "ishandle");
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
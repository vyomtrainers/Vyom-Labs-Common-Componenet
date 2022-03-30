@isTest
private class TriggerHandlerTest {

  private static final String TRIGGER_CONTEXT_ERROR = 'Trigger handler called outside of Trigger execution';

  private static String lastMethodCalled;  
    
  private static TriggerHandlerTest.TestHandler handler;
  static {
    handler = new TriggerHandlerTest.TestHandler();
    handler.isTriggerExecuting = true;
  }

  @isTest
  static void testBeforeInsert() {
    beforeInsertMode();
    handler.run('TestHandler');
  }

  @isTest
  static void testBeforeUpdate() {
    beforeUpdateMode();
    handler.run('TestHandler');
  }

  @isTest
  static void testBeforeDelete() {
    beforeDeleteMode();
    handler.run('TestHandler');
  }

  @isTest
  static void testAfterInsert() {
    afterInsertMode();
    handler.run('TestHandler');
  }

  @isTest
  static void testAfterUpdate() {
    afterUpdateMode();
    handler.run('TestHandler');
  }

  @isTest
  static void testAfterDelete() {
    afterDeleteMode();
    handler.run('TestHandler');
  }

  @isTest
  static void testAfterUndelete() {
    afterUndeleteMode();
    handler.run('TestHandler');  }

  @isTest 
  static void testGetHandlerName() {
    System.assertEquals('TestHandler', handler.getHandlerName(), 'handler name should match class name');
  }

  // test virtual methods
  
  @isTest
  static void testVirtualMethods() {
    TriggerHandler h = new TriggerHandler();
    h.beforeInsert();
    h.beforeUpdate();
    h.beforeDelete();
    h.afterInsert();
    h.afterUpdate();
    h.afterDelete();
    h.afterUndelete();
  }

  private static void resetTest() {
    lastMethodCalled = null;
  }

  // modes for testing

  private static void beforeInsertMode() {
    handler.setTriggerContext('before insert', true);
  }

  private static void beforeUpdateMode() {
    handler.setTriggerContext('before update', true);
  }

  private static void beforeDeleteMode() {
    handler.setTriggerContext('before delete', true);
  }

  private static void afterInsertMode() {
    handler.setTriggerContext('after insert', true);
  }

  private static void afterUpdateMode() {
    handler.setTriggerContext('after update', true);
  }

  private static void afterDeleteMode() {
    handler.setTriggerContext('after delete', true);
  }

  private static void afterUndeleteMode() {
    handler.setTriggerContext('after undelete', true);
  }

  // test implementation of the TriggerHandler

  private class TestHandler extends TriggerHandler {

    public override void beforeInsert() {
      TriggerHandlerTest.lastMethodCalled = 'beforeInsert';
    }

    public override void  beforeUpdate() {
      TriggerHandlerTest.lastMethodCalled = 'beforeUpdate';
    }

    public override void beforeDelete() {
      TriggerHandlerTest.lastMethodCalled = 'beforeDelete';
    }

    public override void afterInsert() {
      TriggerHandlerTest.lastMethodCalled = 'afterInsert';
    }

    public override void afterUpdate() {
      TriggerHandlerTest.lastMethodCalled = 'afterUpdate';
    }

    public override void afterDelete() {
      TriggerHandlerTest.lastMethodCalled = 'afterDelete';
    }

    public override void afterUndelete() {
      TriggerHandlerTest.lastMethodCalled = 'afterUndelete';
    }

  }
	
}